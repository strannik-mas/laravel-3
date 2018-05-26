<?php

namespace Corp\Http\Controllers\Admin;

use Corp\Article;
use Corp\Category;
use Corp\Repositories\ArticlesRepository;
use Illuminate\Http\Request;
use Gate;
use Auth;

class ArticlesController extends AdminController
{

    public function __construct(ArticlesRepository $a_rep)
    {
        parent::__construct();

        //31 урок - тут не работает без middleware
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            if(Gate::denies('VIEW_ADMIN_ARTICLES')){
                dump('abort 403');
                abort(403);
            }
            return $next($request);
        });

        $this->a_rep = $a_rep;

        $this->template = env('THEME').'.admin.articles';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //31 урок
        $this->title = 'Менеджер статей';

        $articles = $this->getArticles();
        $this->content = view(env('THEME').'.admin.articles_content')->with('articles', $articles)->render();
//dd($articles);
        return  $this->renderOutput();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //32 урок
        if(Gate::denies('save', new Article())){
            abort(403);
        }

        $this->title = "Добавить новый материал";

        //лучше работать через репозиторий с Category
        $categories = Category::select(['title', 'alias', 'parent_id', 'id'])->get();
        $lists = [];

        foreach ($categories as $category){
            if($category->parent_id == 0){
                $lists[$category->title] = [];
            }else{
                $lists[$categories->where('id', $category->parent_id)->first()->title][$category->id] = $category->title;
            }
        }
        $this->content = view(env('THEME').'.admin.articles_create_content')->with('categories', $lists)->render();

        return $this->renderOutput();
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

    public function getArticles()
    {
        return $this->a_rep->get();
    }
}
