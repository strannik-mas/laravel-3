<?php

namespace Corp\Http\Controllers;

use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Illuminate\Http\Request;

class PortfolioController extends SiteController
{
    //23 урок
    public function __construct(PortfoliosRepository $p_rep)
    {
        parent::__construct(new MenusRepository(new \Corp\Menu));
        $this->template = config('settings.theme') . '.portfolios';

        $this->p_rep = $p_rep;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->title = 'Портфолио';
        $this->keywords = 'keywwwords_Портфолио';
        $this->meta_desc = 'description_Портфолио';

        $portfolios = $this->getPortfolios();

        $content = view(config('settings.theme').'.portfolios_content')->with('portfolios', $portfolios)->render();
        $this->vars = array_add($this->vars, 'content',$content);


        return $this->renderOutput();

    }

    public function getPortfolios($take = false, $paginate = true)
    {
        $portfolios = $this->p_rep->get('*', $take, $paginate);

        if($portfolios) {
            $portfolios->load('filter');
        }

        return $portfolios;
    }

    public function show($alias)
    {

        //24 урок
        $portfolio = $this->p_rep->one($alias);

        $this->title = $portfolio->title;
        $this->keywords = $portfolio->keywords;
        $this->meta_desc = $portfolio->meta_desc;

        $portfolios = $this->getPortfolios(config('settings.other_portfolios'), false);

        $content = view(config('settings.theme').'.portfolio_content')->with(['portfolio' => $portfolio, 'portfolios' => $portfolios])->render();
        $this->vars = array_add($this->vars, 'content', $content);
        return $this->renderOutput();
    }
}
