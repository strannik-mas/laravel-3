<?php

namespace Corp\Http\Controllers;

use Corp\Menu;
use Corp\Repositories\ArticlesRepository;
use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Corp\Repositories\SlidersRepository;
use Illuminate\Http\Request;
use Config;

class IndexController extends SiteController
{
    public function __construct(SlidersRepository $s_rep, PortfoliosRepository $p_rep, ArticlesRepository $a_rep)
    {
        parent::__construct(new MenusRepository(new Menu));
        $this->s_rep = $s_rep;
        $this->bar='right';
        $this->template = config('settings.theme') . '.index';

        $this->p_rep = $p_rep;
        $this->a_rep = $a_rep;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //6 урок
        $sliderItems = $this->getSliders();
//        dd($sliderItems);
        $sliders = view(env("THEME").'.slider')->with('sliders', $sliderItems)->render();
        $this->vars = array_add($this->vars, 'sliders', $sliders);
        /*конец 6 урока*/

        /*7 урок*/
        $portfolios = $this->getPortfolio();
        $content = view(config('settings.theme').'.content')->with('portfolios', $portfolios)->render();
//        dd($portfolio);

        $this->vars = array_add($this->vars, 'content',$content);
        /*конец 7-8 урока*/

        /*9 урок*/
        $articles = $this->getArticles();
        $this->contentRightBar = view(config('settings.theme').'.indexBar')->with('articles', $articles)->render();
//        dd($articles);
        /*конец 9 урок*/
        //10 урок
        $this->keywords = 'Home page';
        $this->meta_desc = 'Home page';
        $this->title = 'Home page';

        //3 урок
        return $this->renderOutput();
    }

    protected function getArticles()
    {
        $articles = $this->a_rep->get(['title', 'created_at', 'img', 'alias'], Config::get('settings.home_articles_count'));
        return $articles;
    }

    public function getSliders()
    {
        $sliders = $this->s_rep->get();
        if($sliders->isEmpty()){
            return false;
        }
        $sliders->transform(function ($item, $key){
            $item->img = Config::get('settings.slider_path').'/'.$item->img;
            return $item;
        });
//        dd($sliders);
        return $sliders;
    }

    protected function getPortfolio()
    {
        $portfolio = $this->p_rep->get('*', Config::get('settings.home_port_count'));
        return $portfolio;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
