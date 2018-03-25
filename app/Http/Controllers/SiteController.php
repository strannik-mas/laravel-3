<?php

namespace Corp\Http\Controllers;

use Corp\Repositories\MenusRepository;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    //

    protected $p_rep;   //для хранения объекта класса portfolio repository
    protected $s_rep;   //slider repository
    protected $a_rep;   //articles repository
    protected $m_rep;   //menus repository
    protected $template;    //имя шаблона
    protected $vars = [];        //переменные шаблона
    protected $bar = false;         //есть ли сайдбар
    protected $contentRightBar = false;
    protected $contentLeftBar = false;

    public function __construct(MenusRepository $m_rep)
    {
        $this->m_rep = $m_rep;
    }

    protected function renderOutput()
    {
        //4 урок
        $menu = $this->getMenu();

        $navigation = view(env('THEME').'.navigation')->render();
        $this->vars = array_add($this->vars, 'navigation', $navigation);
        //конец 4 урока
        return view($this->template)->with($this->vars);
    }

    protected function getMenu()
    {
        $menu = $this->m_rep->get();

        return $menu;
    }
}
