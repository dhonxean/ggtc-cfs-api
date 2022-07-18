<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{Storage, Response};

class TestController extends Controller
{
    //
    public function testDownload () {
        $file = public_path().'/storage/uploads/image-reports/Customized_Fact_Sheet_-_AF.png';
        return Response::download($file);
    }
}
