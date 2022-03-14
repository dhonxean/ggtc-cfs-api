<?php 

namespace App\Traits;

use Carbon\Carbon;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Schema;

use App\Models\Image;
use App\Models\Video;


trait ModelTraits {

    public $default_hidden = ['created_at','updated_at','deleted_at'];

    protected function columns(){
        return Schema::getColumnListing( $this->table );
    }

    public function images () {
        $model = $this->modelName;

        return $this->hasMany(Image::class, 'parent_id', 'id')
                    ->where('model', $model)
                    ->orderBy('sequence');
    }

    public function videos () {
        $model = $this->modelName;

        return $this->hasMany(Video::class, 'parent_id', 'id')
                    ->where('model', $model)
                    ->orderBy('sequence');
    }

    public function uploadImage ($data) {
    	Image::create([
    		'parent_id'    => $this->id,
    		'model'        => $data['model'],
    		'title'        => $data['title'],
            'alt'          => $data['alt'],
    		'sequence'     => $data['sequence'],
    		'path'         => $data['path'],
            'path_resized' => $data['path_resized'],
            'category'     => $data['category'],
            'file_name'    => $data['file_name'],
            'file_size'    => $data['file_size'],
            'file_mode'    => $data['file_mode'],
            'caption'      => $data['caption'],
    	]);
    }
}