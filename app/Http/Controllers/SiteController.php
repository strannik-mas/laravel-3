<?php

namespace Corp\Http\Controllers;

use Corp\Category;
use Corp\Repositories\MenusRepository;
use Illuminate\Http\Request;
use Menu;
use Cache;
use Carbon\Carbon;

class SiteController extends Controller
{
    //

    protected $p_rep;   //для хранения объекта класса portfolio repository
    protected $s_rep;   //slider repository
    protected $a_rep;   //articles repository
    protected $m_rep;   //menus repository
    protected $template;    //имя шаблона
    protected $vars = [];        //переменные шаблона
    protected $bar = 'no';         //есть ли сайдбар
    protected $contentRightBar = false;
    protected $contentLeftBar = false;

    protected $keywords;
    protected $meta_desc;
    protected $title;

    public function __construct(MenusRepository $m_rep)
    {
        $this->m_rep = $m_rep;
    }

    protected function renderOutput()
    {


        //кэширование 1 часть
        //меню храним в ячейке menu

        //полная очистка кэша
//        Cache::flush();

        //частичная очистка кэша
//        Cache::forget('menu');

        /*$navigation = Cache::get('menu', function (){
            $menu = $this->getMenu();
            $tmp = view(config('settings.theme').'.navigation')->with('menu', $menu)->render();
            Cache::forever('menu', $tmp);
            return $tmp;
        });*/

        $navigation = Cache::remember('menu', 10, function (){
            $menu = $this->getMenu();
            return view(config('settings.theme').'.navigation')->with('menu', $menu)->render();
        });

        /*if(Cache::has('menu')){
//            $navigation = Cache::get('menu', 'Menu is empty');
            //сразу же удаляет из кэша ячейку
//            $navigation = Cache::pull('menu', 'Menu is empty');
        }else{
            //4 урок
            $menu = $this->getMenu();
            $navigation = view(config('settings.theme').'.navigation')->with('menu', $menu)->render();
            $time = Carbon::now()->addMinutes(10);
            Cache::put('menu', $navigation, $time);
            //сохранение в кэше постоянно
//            Cache::forever('menu', $navigation);
        }*/


        $this->vars = array_add($this->vars, 'navigation', $navigation);
//        dump($this->vars);
        //конец 4 урока

        //9 урок
        if($this->contentRightBar){
            $rightBar = view(config('settings.theme').'.rightBar')->with('content_rightBar', $this->contentRightBar)->render();
            $this->vars = array_add($this->vars, 'rightBar', $rightBar);
        }

        //25 урок
        if($this->contentLeftBar){
            $leftBar = view(config('settings.theme').'.leftBar')->with('content_leftBar', $this->contentLeftBar)->render();
            $this->vars = array_add($this->vars, 'leftBar', $leftBar);
        }

        //10 урок
        $this->vars = array_add($this->vars, 'bar', $this->bar);

        $footer = view(config('settings.theme').'.footer')->render();
        $this->vars = array_add($this->vars, 'footer', $footer);
        $this->vars = array_add($this->vars, 'keywords', $this->keywords);
        $this->vars = array_add($this->vars, 'meta_desc', $this->meta_desc);
        $this->vars = array_add($this->vars, 'title', $this->title);
        return view($this->template)->with($this->vars);
    }

    public function getMenu()
    {
        $menu = $this->m_rep->get();

        //5 урок
        $mBuilder = Menu::make('MyNav', function ($m) use ($menu){
            foreach ($menu as $item) {
                if($item->parent === 0){
                    $m->add($item->title, $item->path)->id($item->id);
                } else {
                    if($m->find($item->parent)){
                        $m->find($item->parent)->add($item->title, $item->path)->id($item->id);
                    }
                }
            }
        });
//dd($mBuilder);
        return $mBuilder;
    }
}
