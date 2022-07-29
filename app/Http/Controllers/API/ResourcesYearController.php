<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Traits\MainTraits;
use App\Models\{
	ResourcesYear,
	Image,
};

class ResourcesYearController extends Controller
{
    use MainTraits;
	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
    public function create (Request $r) {
        $validator = \Validator::make($r->all(), [
			'year' 		=> 'required|integer|min:4|unique:resources_years',
			'featured'	=> 'required',
			'web_image'		=> 'required',
            'web_image.*'	=> 'required|mimes:jpeg,png,jpg|max:5000',
			'mobile_image'	=> 'required',
            'mobile_image.*'=> 'required|mimes:jpeg,png,jpg|max:5000',
		]);

        if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

        $year = ResourcesYear::create([
            'year' => $r->year,
            'featured' => $r->featured
        ]);

        if ($r->hasFile('web_image')) {
			$this->addImages('resources_year', $r, $year, 'web_image');
		}

		if ($r->hasFile('mobile_image')) {
			$this->addImages('resources_year', $r, $year, 'mobile_image');
		}

        $year->load('images');

        return response([
            'res' => $year
        ]);

    }

    public function list (Request $r) {
        $year = ResourcesYear::orderByDesc('year')->get();

        return response ([
            'res' => $year
        ]);
    }

    public function info (ResourcesYear $id) {
        $id->load('images');

        return response ([
            'res' => $id
        ]);
    }

    public function delete (ResourcesYear $id) {
        $id->delete();

        return response ([
            'res' => 'Year deleted successfully!'
        ]); 
    }

    public function update (ResourcesYear $id, Request $r) {
        $validator = \Validator::make($r->all(), [
            'year'	=> [
				'required',
                'integer',
                'min:4',
				Rule::unique('resources_years')->ignore($id)
			],
			'featured'	=> 'required',
			'web_image'		=> 'sometimes',
            'web_image.*'	=> 'sometimes|mimes:jpeg,png,jpg|max:5000',
			'mobile_image'	=> 'sometimes',
            'mobile_image.*'=> 'sometimes|mimes:jpeg,png,jpg|max:5000',
		]);

        if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

        $id->update([
            'year' => $r->year,
            'featured' => $r->featured,
        ]);

        $this->updateImages('resources_year', $r, $id, 'web_image');
		$this->updateImages('resources_year', $r, $id, 'mobile_image');

        $id->load('images');

		return response([
			'res' => $id
		]);
    }
}
