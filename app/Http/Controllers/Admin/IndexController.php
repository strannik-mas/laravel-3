<?php

namespace Corp\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Gate;
use Illuminate\Support\Facades\Auth;

class IndexController extends AdminController
{
    //28 урок
    public function __construct()
    {
        parent::__construct();

        //30 урок - тут не работает без middleware
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            if(Gate::denies('VIEW_ADMIN')){
                dump('view_ad');
                abort(403);
            }
            return $next($request);
        });


        $this->template = env('THEME').'.admin.index';
    }

    public function index()
    {

        $this->title = 'Панель администратора';

        return $this->renderOutput();
    }
}
