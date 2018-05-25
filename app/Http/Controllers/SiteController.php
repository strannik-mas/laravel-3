<?php

namespace Corp\Http\Controllers;

use Corp\Repositories\MenusRepository;
use Illuminate\Http\Request;
use Menu;

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
        //4 урок
        $menu = $this->getMenu();

        $navigation = view(env('THEME').'.navigation')->with('menu', $menu)->render();
        $this->vars = array_add($this->vars, 'navigation', $navigation);
//        dump($this->vars);
        //конец 4 урока

        //9 урок
        if($this->contentRightBar){
            $rightBar = view(env('THEME').'.rightBar')->with('content_rightBar', $this->contentRightBar)->render();
            $this->vars = array_add($this->vars, 'rightBar', $rightBar);
        }

        //25 урок
        if($this->contentLeftBar){
            $leftBar = view(env('THEME').'.leftBar')->with('content_leftBar', $this->contentLeftBar)->render();
            $this->vars = array_add($this->vars, 'leftBar', $leftBar);
        }

        //10 урок
        $this->vars = array_add($this->vars, 'bar', $this->bar);

        $footer = view(env('THEME').'.footer')->render();
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
