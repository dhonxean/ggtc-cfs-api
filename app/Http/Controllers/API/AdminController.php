<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

use App\Models\User;

class AdminController extends Controller
{
	public function login(Request $r) {
		$validator = \Validator::make($r->all(), [
			'email'    => 'required',
			'password'  => 'required',    
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$user = User::where([
			'email' => $r->email,
			'status' => 'Active'
		])->first();

		if ($user) {
			if (Hash::check($r->password, $user->password)) {
				$token = $user->createToken('GGTC CFS Admin API Access Token')->accessToken;
				return response([
					'user'  => $user,
					'token' => $token
				]);
			}
			else {
				return response([
					'errors' => ['Wrong password. Please try again.']
				]);
			}
		}
		else {
			return response([
				'errors' => ['User not found. Please try again.']
			]);
		}
	}

	public function createAdmin(Request $r) {
		$validator = \Validator::make($r->all(), [
			'username'    => 'sometimes',
			'first_name'  => 'required',
			'middle_name' => 'sometimes',
			'last_name'   => 'required',
			'email'       => 'required|email',
			'password'    => 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$user = User::where([
			'email'    => $r->email,
			'status'   => 'Active'
		])
		->first();

		if (!$user) {
			# save user details
			$user = User::create([
				'username'      => ($r->username) ? $r->username : null,
				'first_name'    => $r->first_name,
				'last_name'     => $r->last_name,
				'middle_name'   => $r->middle_name ?? null,
				'email'         => $r->email,
				'password'      => Hash::make($r->password),
				'status'        => 'Active',
				'role_id'       => 1     
			]);
	
			return response([
				'user' => $user
			]);
		}
		else {
			return response([
				'errors' => ['Email already exists.']
			]);
		}
	}
}
