<?php

namespace App\Traits;

use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

use Intervention\Image\Facades\Image as ImageInt;

trait MainTraits {

    public function record_exists( $field, $value, $model ) {
        $record = null;
        if ( !is_null( $model ) && $model != "" ) {
            if( !is_null($value) && $value != "" ){
                $query = null;
                $model = '\App\Models\\'. $model;
                $query = $model::where($field, $value)->first();
                $record = $query;
            }
        }
        return $record;
    }

    public function slugify ($str, $model, $ref_id = null) {
        $MODEL = '\App\Models\\' . $model;
        $slug = str_slug( strtolower( $str ) , '-');

        $record =  $MODEL::whereSlug( $slug )->first();
        if ( !is_null( $record ) ) {
            $query  = $MODEL::where('slug','like', $slug.'%')->whereNull('deleted_at');

            if (!is_null($ref_id)){
                $query = $query->where('id','!=',$ref_id);
            }

            $count  = $query->latest('id')->count();
            if ($count > 0) {
                $slug = "{$slug}-{$count}";
            }
        }

        return $slug;
    }


    /**
     * [addImages function]
     * @param [string] $model - Name of the model in snake case. Make it singular (e.g. product_variant, customer_detail)
     * @param [object/array] $r - The Request object. It contains the images
     * @param [Table record] $record - Model record
     * @param [String] $field  - string, name of the file field
     */
    function addImages ($model, $r, $record, $field = NULL, $specificKey = null) {
        $file = ($field) ?? 'file';
        $existingImagesCount = $record->images($model)->count();

        $file_id  = $file . '_id';
        $file_title  = $file . '_title';
        $file_alt = $file . '_alt';
        $file_category = $file . '_category';
        $file_sequence = $file . '_sequence';
        $file_mode = $file . '_mode';
        $file_caption = $file . '_caption';


        foreach ($r->$file as $key => $image) {
            $proceed = true;

            if ($proceed) {
                if ($specificKey != null) {
                    if ($specificKey == $key) {
                        $uploadedImage = $this->uploadFile($image, null, null, $model);
                        $imageData = [
                            'model' => $model,
                            'title' => (isset($r->$file_title)) ? $r->$file_title[$key] : null,
                            'alt' => (isset($r->$file_alt)) ? $r->$file_alt[$key] : null,
                            'path' => $uploadedImage->path,
                            'path_resized' => $uploadedImage->path_resized,
                            'category' => (isset($r->$file_category)) ? $r->$file_category[$key] : $field,
                            'sequence' => (isset($r->$file_sequence)) ? $r->$file_sequence[$key] : 0, //$existingImagesCount + 1,
                            'file_name' => $uploadedImage->original_file_name,
                            'file_size' => $uploadedImage->file_size,
                            'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                            'caption'   => (isset($r->$file_caption)) ? $r->$file_caption[$key] : null,
                        ];
                        $record->uploadImage($imageData);
                    }
                }
                else {
                    $uploadedImage = $this->uploadFile($image, null, null, $model);
                    $imageData = [
                        'model' => $model,
                        'title' => (isset($r->$file_title)) ? $r->$file_title[$key] : null,
                        'alt' => (isset($r->$file_alt)) ? $r->$file_alt[$key] : null,
                        'path' => $uploadedImage->path,
                        'path_resized' => $uploadedImage->path_resized,
                        'category' => (isset($r->$file_category)) ? $r->$file_category[$key] : $field,
                        'sequence' => (isset($r->$file_sequence)) ? $r->$file_sequence[$key] : 0, //$existingImagesCount + 1,
                        'file_name' => $uploadedImage->original_file_name,
                        'file_size' => $uploadedImage->file_size,
                        'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                        'caption'   => (isset($r->$file_caption)) ? $r->$file_caption[$key] : null,
                    ];
                    $record->uploadImage($imageData);
                }
            }
        }
    }

    function updateImages ($model, $r, $record, $field = NULL) {
        $file = ($field) ?? 'file';
        $existingImagesCount = $record->images($model)->count();

        $file_id  = $file . '_id';
        $file_title  = $file . '_title';
        $file_alt = $file . '_alt';
        $file_category = $file . '_category';
        $file_sequence = $file . '_sequence';
        $file_mode = $file . '_mode';
        $file_caption = $file . '_caption';
        
        if ($r->$file_id) {
            // $file = ($field) ?? 'file';
            foreach ($r->$file_id as $key => $image_id) {
                if ($image_id == 0) { # if new image, upload this
                    $image = $r->$file[$key];
                    $uploadedImage = $this->uploadFile($image, null, null, $model);
                    $imageData = [
                        'title' => (isset($r->$file_title)) ? $r->$file_title[$key] : null,
                        'alt' => (isset($r->$file_alt)) ? $r->$file_alt[$key] : null,
                        'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                        'sequence' => (isset($r->$file_sequence)) ? $r->$file_sequence[$key] : 0, //$existingImagesCount + 1,
                        'path' => $uploadedImage->path,
                        'path_resized' => $uploadedImage->path_resized,
                        'category' => (isset($r->$file_category)) ? $r->$file_category[$key] : null,
                        'model' => $model,
                        'file_name' => $uploadedImage->original_file_name,
                        'file_size' => $uploadedImage->file_size,
                        'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                        'caption'   => (isset($r->$file_caption)) ? $r->$file_caption[$key] : null,
                    ];
                    $record->uploadImage($imageData);
                } else { # if old image
                    $_IMAGE_Model = '\App\Models\\Image';
                    if (isset($r->$file[$key])) { # if a new image is selected
                        # update the old image data
                        $existingImage = $_IMAGE_Model::where('id', $image_id)->first();
                        $uploadedImage = $this->uploadFile($r->$file[$key], $existingImage->path, $existingImage->path_resized, $model);
                        $existingImage->update([
                            'title' => (isset($r->$file_title)) ? $r->$file_title[$key] : null,
                            'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                            'alt' => (isset($r->$file_alt)) ? $r->$file_alt[$key] : null,
                            'sequence' => (isset($r->$file_sequence)) ? $r->$file_sequence[$key] : 0, //$existingImagesCount + 1,
                            'path' => $uploadedImage->path,
                            'path_resized' => $uploadedImage->path_resized,
                            'file_name' => $uploadedImage->original_file_name,
                            'file_size' => $uploadedImage->file_size,
                            'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                            'caption'   => (isset($r->$file_caption)) ? $r->$file_caption[$key] : null,
                        ]);
                    } else { # if no new image is selected
                        $existingImage = $_IMAGE_Model::where('id', $image_id)->first();
                        $existingImage->update([
                            'title' => (isset($r->$file_title)) ? $r->$file_title[$key] : null,
                            'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                            'alt' => (isset($r->$file_alt)) ? $r->$file_alt[$key] : null,
                            'sequence' => (isset($r->$file_sequence)) ? $r->$file_sequence[$key] : 0, //$existingImagesCount + 1,
                            'file_mode' => (isset($r->$file_mode)) ? $r->$file_mode[$key] : null,
                            'caption'   => (isset($r->$file_caption)) ? $r->$file_caption[$key] : null,
                        ]);
                    }
                }
            }
        }
    }

    function getContentType ($extension) {
        $result;
        switch ($extension) {
            case 'svg':
            case 'SVG':
                $result = 'image/svg+xml';
                break;
            case 'gif':
            case 'GIF':
                $result = 'image/gif';
                break;
            case 'pdf':
            case 'PDF':
                $result = 'application/pdf';
                break;
            case 'ppt':
            case 'PPT':
                $result = 'application/vnd.ms-powerpoint';
                break;
            case 'pptx':
            case 'PPTX':
                $result = 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
                break;
            case 'xls':
            case 'XLS':
                $result = 'application/vnd.ms-excel';
                break;
            case 'xlsx':
            case 'XLSX':
                $result = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
                break;
            case 'docx':
            case 'DOCX':
                $result = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
                break;
            case 'doc':
            case 'DOC':
                $result = 'application/msword';
                break;
            case 'txt':
            case 'TXT':
                $result = 'text/plain';
                break;
        }

        return $result;
    }

    function uploadFile ($file, $oldFilePath = null, $oldFilePathResized = null, $model = null) {
        $disk = 'public'; # s3 kapag s3. public kapag sa local lang isesave

        # get the file size
        $size = filesize($file);
        $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
        $power = $size > 0 ? floor(log($size, 1024)) : 0;
        $fileSize = number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];

        # delete the old file if it exists
        if ($oldFilePath != null) {
            Storage::disk($disk)->delete("uploads/$oldFilePath");
        }
        if ($oldFilePathResized != null) {
            Storage::disk($disk)->delete("uploads/$oldFilePathResized");
        }

        $filenameWithExtension = $file->getClientOriginalName();
        $extension = $file->getClientOriginalExtension();
        $filename = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
        $folderDate = Carbon::now()->format('Y-m-d');
        $folderTime = Carbon::now()->format('H-i-s-u');
        $filenameToStoreOriginal = $filename . '.' . $extension;
        $filenameToStore = $folderDate . '_' . $folderTime . '.' . $extension;
        $otherAcceptedExtensions = ['svg', 'gif', 'pdf', 'ppt', 'pptx', 'xls', 'xlsx', 'docx', 'doc', 'txt', 'SVG', 'GIF', 'PDF', 'PPT', 'PPTX', 'XLS', 'XLSX', 'DOCX', 'DOC', 'TXT'];

        // $uploadPath = "uploads/$folderDate/$folderTime/$filenameToStore"; //old
        if (is_null($model)){
            $uploadPath = "uploads/$folderDate/$filenameToStore";
        }else{
            $uploadPath = "uploads/". $model ."/$folderDate/$filenameToStore";
        }

        # if the file is svg or gif, directly upload it and stop the function immediately by returning the path names
        if (in_array($extension, $otherAcceptedExtensions)) {
            Storage::disk($disk)->put($uploadPath, file_get_contents($file), [
                'visibility' => 'public',
                'ContentType' => $this->getContentType($extension)
            ]);

            $toReturn = (object) [
                'path' => $uploadPath,
                'path_resized' => $uploadPath,
                'original_file_name' => $filenameToStore,
                'file_size' => $fileSize,
                'file_type' => $extension,
                'main_original_file_name' =>  $filenameToStoreOriginal,
            ];

            return $toReturn;
        }

        $unresizedFile = ImageInt::make($file->getRealPath())->interlace()->encode($extension, 80)->orientate();
        Storage::disk($disk)->put($uploadPath, $unresizedFile->getEncoded(), 'public');

        # upload resized file
        $resizedFile = ImageInt::make($file->getRealPath())->resize(750, 750, function ($c) {
            $c->aspectRatio();
            $c->upsize();
        })->interlace()->encode($extension, 80)
        ->orientate();

        $filenameToStore_resized = $filename . '_thumbnail.' . $extension;
        $filenameToStore = $folderDate . '_' . $folderTime . '_resized.' . $extension;
        // $uploadPathResized = "uploads/$folderDate/$folderTime/$filenameToStore_resized"; //old
        if (is_null($model)){
            $uploadPathResized = "uploads/all_files/$folderDate/$filenameToStore_resized";
        } else {
            $uploadPathResized = "uploads/" . $model. "/$folderDate/$filenameToStore";
        }

        Storage::disk($disk)->put($uploadPathResized, $resizedFile->getEncoded(), 'public');

        $toReturn = (object) [
            // 'path' => "uploads/$folderDate/$folderTime/$filenameToStore",
            // 'path_resized' => "uploads/$folderDate/$folderTime/$filenameToStore_resized",
            'path' => $uploadPath,
            'path_resized' => $uploadPathResized,
            'original_file_name' => $filenameWithExtension,
            'main_original_file_name' =>  $filenameToStoreOriginal,
            'file_size' => $fileSize,
            'file_type' => $extension
        ];

        return $toReturn;
    }

    function fileIsImage ($file) {
        $result = false;
        if (@is_array(getimagesize($file))){
            $result = true;
        }

        return $result;
    }

    function deleteImage($file) {
        
    }

}
