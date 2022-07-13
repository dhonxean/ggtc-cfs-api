<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Company;

class CompanyController extends Controller
{
	

	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
	public function create(Request $r) {
		$validator = \Validator::make($r->all(), [
			'name'    => 'required|unique:companies',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$companies = Company::where('name', $r->name)->first();
		
		if(!$companies) {
			$company = Company::create([
				'name' => $r->name
			]);

			return response([
				'res' => $company
			]);
		}	
		else {
			return response([
				'errors' => ['Company already exists.']
			]);
		}
	}

	public function info($id) {
		$company = Company::where('id', $id)->first();

		if ($company) {
			return response([
				'res' => $company
			]);
		}
		else {
			return response([
				'errors' => ['Company not found!']
			]);
		}
	}

	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'name' => [
						'required',
						Rule::unique('companies')->ignore($id),
					],
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$company = Company::where('id', $id)->first();

		if ($company) {
			$company->update([
				'name' => $r->name
			]);
			
			return response([
				'res' => $company
			]);
		}
		else {
			return response([
				'errors' => ['Company not found!']
			]);
		}
	}

	public function delete($id, Request $r) {
		$company = Company::where('id', $id)->first();

		if ($company) {
			$company->delete();

			return response([
				'res' => ['Company deleted.']
			]);
		}
		else {
			return response([
				'errors' => ['Company not found!']
			]);
		}
	}

	public function getAllCompany(Request $r){
		$company = Company::when(isset($r->keyword), function ($query) use ($r) {
					$query->where('name', 'LIKE', '%'.strtolower($r->keyword).'%');	
				})
				->when(isset($r->sort_by), function ($query) use ($r) {
					if ($r->order_type == 'desc') {
						$query->orderByDesc($r->sort_by);
					}
					else {
						$query->orderBy($r->sort_by);
					}
				})
				->when( $r->filled('all') , function ($q, $r) {
					return $q->get();
				}, function ($q) {
					return $q->paginate(20);
				});


		return response([
			'res' => $company
		]);
	}
}
