<?php
/**
 * Created by PhpStorm.
 * User: Alex
 * Date: 25.03.2018
 * Time: 18:52
 */

namespace Corp\Repositories;
use Corp\Http\Requests\MenusRequest;
use Corp\Menu;
use Gate;

class MenusRepository extends Repository
{
    public function __construct(Menu $menu)
    {
        $this->model = $menu;
    }

    public function addMenu(MenusRequest $request)
    {
        if(Gate::denies('save', $this->model)){
            abort(403);
        }

        $data = $request->only('type', 'title', 'parent');
        if(empty($data)){
            return ['error' => 'no data'];
        }

        switch ($data['type']){
            case 'customLink':
                $data['path'] = $request->input('custom_link'); break;
            case 'blogLink':
                if($request->input('category_alias')){
                    if($request->input('category_alias') == 'parent'){
                        $data['path'] = route('index.articles');
                    }else{
                        $data['path'] = route('articlesCat', ['cat_alias'=>$request->category_alias]);
                    }
                }elseif ($request->input('article_alias')){
                    $data['path'] = route('show.article', ['alias'=>$request->input('article_alias')]);
                }
                break;
            case 'portfolioLink':
                if($request->input('filter_alias')){
                    if($request->input('filter_alias') == 'parent'){
                        $data['path'] = route('portfolios.index');
                    }else{
//                        $data['path'] = route('portfoliosFilter', ['portf_alias'=>$request->filter_alias]);
                    }
                }elseif ($request->input('portfolio_alias')){
                    $data['path'] = route('portfolios.show', ['alias'=>$request->input('portfolio_alias')]);
                }
                break;
            default:
                $data['path'] = route('home');
        }

        unset($data['type']);
        if($this->model->fill($data)->save()){
            return ['status' => 'Ссылка добавлена'];
        }
    }

    public function updateMenu($request, $menu)
    {
        if(Gate::denies('save', $this->model)){
            abort(403);
        }

        $data = $request->only('type', 'title', 'parent');
        if(empty($data)){
            return ['error' => 'no data'];
        }

        switch ($data['type']){
            case 'customLink':
                $data['path'] = $request->input('custom_link'); break;
            case 'blogLink':
                if($request->input('category_alias')){
                    if($request->input('category_alias') == 'parent'){
                        $data['path'] = route('index.articles');
                    }else{
                        $data['path'] = route('articlesCat', ['cat_alias'=>$request->category_alias]);
                    }
                }elseif ($request->input('article_alias')){
                    $data['path'] = route('show.article', ['alias'=>$request->input('article_alias')]);
                }
                break;
            case 'portfolioLink':
                if($request->input('filter_alias')){
                    if($request->input('filter_alias') == 'parent'){
                        $data['path'] = route('portfolios.index');
                    }else{
//                        $data['path'] = route('portfoliosFilter', ['portf_alias'=>$request->filter_alias]);
                    }
                }elseif ($request->input('portfolio_alias')){
                    $data['path'] = route('portfolios.show', ['alias'=>$request->input('portfolio_alias')]);
                }
                break;
            default:
                $data['path'] = route('home');
        }

        unset($data['type']);
        if($menu->fill($data)->update()){
            return ['status' => 'Ссылка обновлена'];
        }
    }

    public function deleteMenu($menu)
    {
        if(Gate::denies('save', $this->model)){
            abort(403);
        }

        if($menu->delete()){
            return ['status' => 'Ссылка удалена'];
        }
    }
}