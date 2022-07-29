<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Traits\MainTraits;
use App\Models\{
	ResourcesYear,
    Resource,
};

class ResourcesController extends Controller
{
    use MainTraits;
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
    public function create (Request $r) {
        $validator = \Validator::make($r->all(), [
			'year_id' 		=> 'required',
			'file_title'	=> 'required',
		]);

        if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

        if ($r->hasFile('file')) {
            $year = ResourcesYear::where('id', $r->year_id)->first();
            if ($year) {
                $file = $this->uploadFile($r->file[0], null, null, 'resource_files');
                $resultData = Resource::create([
                    'year_id'   => $r->year_id,
                    'file_title'=> $r->file_title,
                    'file_path' => $file->path,
                    'file_name' => $file->original_file_name,
                    'file_size' => $file->file_size,
                    'file_type' => $file->file_type,
                    'file_name_orig' => $file->main_original_file_name,
                ]);

                $resultData->load('year');

                return response ([
                    'res' => $resultData
                ]);
            }
            else {
                return response([
                    'errors' => ['Invalid Year']
                ], 400);
            }
		}
        else {
            return response([
				'errors' => ['Please upload file!']
			], 400);
        }
    }

    public function list (Request $r) {
        $resource = Resource::select('resources.id', 'resources.file_title', 'resources.year_id', 'year.year', 'resources.created_at')
        ->when(isset($r->keyword), function ($query) use ($r) {
            $q->where('resources.file_title', 'LIKE', '%'.strtolower($r->keyword).'%');
        })
        ->join('resources_years as year', 'year.id', '=', 'resources.year_id')
        ->when(isset($r->year_id), function ($q) use ($r) {
            $q->where('year_id', $r->year_id);
        })
        ->when(isset($r->sort_by), function ($query) use ($r) {
            if ($r->sort_by == 'year') {
                if ($r->order_type == 'desc') {
                    $query->orderByDesc('year.year');
                }
                else {
                    $query->orderBy('year.year');
                }
            }
            else {
                if ($r->order_type == 'desc') {
                    $query->orderByDesc('resources.'.$r->sort_by);
                }
                else {
                    $query->orderBy('resources.'.$r->sort_by);
                }
            }
        })
        ->when( $r->filled('all') , function ($q, $r) {
            return $q->get();
        }, function ($q) {
            return $q->paginate(10);
        });

        return response ([
            'res' => $resource
        ]);
    }

    public function info (Resource $id) {
        $id->load('year');

        return response ([
            'res' => $id
        ]);
    }

    public function delete (Resource $id) {
        $id->delete();

        return response ([
            'res' => 'Resource file deleted successfully!'
        ]); 
    }

    public function update (Resource $id, Request $r) {
        $validator = \Validator::make($r->all(), [
			'year_id' 		=> 'required',
			'file_title'	=> 'required',
		]);

        if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}
        $year = ResourcesYear::where('id', $r->year_id)->first();
        if ($year) {
            $id->update([
                'year_id' => $r->year_id,
                'file_title' => $r->file_title,
            ]);
    
            if ($r->hasFile('file')) {
                $file = $this->uploadFile($r->file[0], null, null, 'resource_files');
                $id->update([
                    'file_path' => $file->path,
                    'file_name' => $file->original_file_name,
                    'file_size' => $file->file_size,
                    'file_type' => $file->file_type,
                    'file_name_orig' => $file->main_original_file_name,
                ]);

                
            }
            
            $id->load('year');

            return response ([
                'res' => $id
            ]);
        }
        else {
            return response([
                'errors' => ['Invalid Year']
            ], 400);
        }
    }
}
