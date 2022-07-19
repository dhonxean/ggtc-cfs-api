<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Traits\MainTraits;

use App\Models\{
	Banner,
	BannerFile
};

class BannersController extends Controller
{
	use MainTraits;

	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'title' 		=> 'required',
			'type' 			=> 'required',
			'published' 	=> 'required',
			'web_image'		=> 'required',
            'web_image.*'	=> 'required|mimes:jpeg,png,jpg|max:5000',
			'mobile_image'	=> 'required',
            'mobile_image.*'=> 'required|mimes:jpeg,png,jpg|max:5000',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 200);
		}

		$banner = Banner::create([
			'title' => $r->title,
			'type' => $r->type,
			'published' => $r->published,
			'link' => $r->link,
			'has_download' => $r->has_download,
			'download_label' => $r->has_download ? $r->download_label : null,
		]);
		
		if ($r->hasFile('web_image')) {
			$this->addImages('banner', $r, $banner, 'web_image');
		}

		if ($r->hasFile('mobile_image')) {
			$this->addImages('banner', $r, $banner, 'mobile_image');
		}

		if ($r->hasFile('file')) {
			foreach ($r->file as $key => $value) {
				$file = $this->uploadFile($r->file[$key], null, null, 'banner_files');

				$resultData = BannerFile::create([
					'banner_id' => $banner->id,
					'file_path' => $file->path,
					'file_name' => $file->original_file_name,
					'file_size' => $file->file_size,
					'file_type' => $file->file_type,
					'file_name_orig' => $file->main_original_file_name,
				]);
			}
		}

		$banner->load('images', 'banner_file');

		return response([
			'res' => $banner
		]);
	}

	public function info(Banner $id) {
		$id->load('images','banner_file');

		return response([
			'res' => $id
		]);
	}

	public function delete(Banner $id) {
		$id->banner_file()->delete();
		$id->delete();

		return response([
			'res' => 'Banner deleted successfully!'
		]);
	}

	public function update(Banner $id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'title' 		=> 'required',
			'type' 			=> 'required',
			'published' 	=> 'required',
			'web_image'		=> 'sometimes',
            'web_image.*'	=> 'sometimes|mimes:jpeg,png,jpg|max:5000',
			'mobile_image'	=> 'sometimes',
            'mobile_image.*'=> 'sometimes|mimes:jpeg,png,jpg|max:5000',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 200);
		}

		$id->update([
			'title' => $r->title,
			'type' => $r->type,
			'published' => $r->published,
			'link' => $r->link,
			'has_download' => $r->has_download,
			'download_label' => $r->has_download ? $r->download_label : null,
		]);

		$this->updateImages('banner', $r, $id, 'web_image');
		$this->updateImages('banner', $r, $id, 'mobile_image');

		$banner_file = BannerFile::where('banner_id',$id->id)->first();

		if ($r->hasFile('file')) {
			foreach ($r->file as $key => $value) {
				$file = $this->uploadFile($r->file[$key], null, null, 'banner_files');

				if ($banner_file) {
					$banner_file->update([
						'file_path' => $file->path,
						'file_name' => $file->original_file_name,
						'file_size' => $file->file_size,
						'file_type' => $file->file_type,
						'file_name_orig' => $file->main_original_file_name,
					]);
				}
				else {
					$resultData = BannerFile::create([
						'banner_id' => $id->id,
						'file_path' => $file->path,
						'file_name' => $file->original_file_name,
						'file_size' => $file->file_size,
						'file_type' => $file->file_type,
						'file_name_orig' => $file->main_original_file_name,
					]);
				}
			}
		}

		if (!$r->has_download) {
			$id->banner_file()->delete();
		}

		$id->load('images', 'banner_file');

		return response([
			'res' => $id
		]);
	}

	public function list() {
		$banner = Banner::orderByDesc('created_at')->paginate(10);

		return response([
			'res' => $banner
		]);
	}

	/**
	 ** ###[ WEB APIs ]###########################
	**
	**/
	public function getBanners($type) {
		$banner = Banner::where([
			'type' => $type,
			'published' => 1
		])
		->with('images')
		->first();

		return response([
			'res' => $banner
		]);
	}
}
