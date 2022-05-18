<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use App\Models\User;

class AdminController extends Controller
{

	/**
	 ** ###[ CMS APIs ]###########################
	**
	**/
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
				], 403);
			}
		}
		else {
			return response([
				'errors' => ['User not found. Please try again.']
			], 403);
		}
	}
	
	public function logout(Request $r) {
		if ($r->user()) {
            $token = $r->user()->token();
            $token->revoke();
        }

        return response([
            'message' => 'User logged out'
        ]);
	}

	public function create(Request $r) {
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
				'res' => $user
			]);
		}
		else {
			return response([
				'errors' => ['Email already exists.']
			]);
		}
	}

	public function info(Request $r) {
		if ($r->user()) {
			return response([
				'user' => $r->user()
			]);
		}
		else {
			return response([
				'error' => ['User not found']
			]);
		}
	}

	public function update($id, Request $r) {
		$validator = \Validator::make($r->all(), [
			'username'    => 'sometimes',
			'first_name'  => 'required',
			'middle_name' => 'sometimes',
			'last_name'   => 'required',
			'email'       => [
								'required',
								'email',
								Rule::unique('users')->ignore($id),
							],
			'status'    => 'required',
			'password'    => 'required',
			'role_id'    => 'required',
		]);

		if ($validator->fails()) {
			return response([
				'errors' => $validator->errors()->all()
			], 400);
		}

		$user = User::where('id', $r->user()->id)->first();

		if ($user) {
			$user->update([
				'username'      => ($r->username) ? $r->username : null,
				'first_name'    => $r->first_name,
				'last_name'     => $r->last_name,
				'middle_name'   => $r->middle_name ?? null,
				'email'         => $r->email,
				'password'      => Hash::make($r->password),
				'status'        => $r->status,
				'role_id'       => $r->role_id
			]);

			$user->load('role');

			return response([
				'res' => $user
			]);
		}
		else {
			return response([
				'errors' => ['User not found.']
			]);
		}
	}
}
