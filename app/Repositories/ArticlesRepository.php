<?php


namespace Corp\Repositories;

use Corp\Article;
use Illuminate\Support\Facades\Gate;
use Image;
use Config;

class ArticlesRepository extends Repository
{
    public function __construct(Article $article)
    {
        $this->model = $article;
    }

    //16 урок
    public function one($alias, $attr = [])
    {
        $article = parent::one($alias, $attr);
        if($article && !empty($attr)){
            $article->load('comments');
            $article->comments->load('user');
        }

        return $article;
    }

    public function addArticle($request)
    {
        if(Gate::denies('save', $this->model)){
            abort('403');
        }

        $data = $request->except('_token', 'image');

        if(empty($data)){
            return ['error' => 'no data'];
        }

        if(empty($data['alias'])){
            $data['alias'] = $this->transliterate($data['title']);
        }

        if($this->one($data['alias'], false)){
            $request->merge(['alias' => $data['alias']]);
            $request->flash();

            return ['error' => 'Данный псевдоним уже используется'];
        }

        if($request->hasFile('image')){
            $image = $request->file('image');

            if($image->isValid()){
                $str = str_random(8);

                $obj = new \stdClass;
                $obj->mini = $str.'_mini.jpg';
                $obj->max = $str.'_max.jpg';
                $obj->path = $str.'.jpg';

                $img = Image::make($image);
                $img->fit(Config::get('settings.image')['width'], Config::get('settings.image')['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->path);

                $img->fit(Config::get('settings.articles_img')['max']['width'], Config::get('settings.articles_img')['max']['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->max);

                $img->fit(Config::get('settings.articles_img')['mini']['width'], Config::get('settings.articles_img')['mini']['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->mini);

                $data['img'] = json_encode($obj);
                $this->model->fill($data);
                if($request->user()->articles()->save($this->model)){
                    return ['status' => 'Материал добавлен!'];
                }
            }
        }

    }

    public function updateArticle($request, $article)
    {
        if(Gate::denies('edit', $this->model)){
            abort('403');
        }

        $data = $request->except('_token', 'image', '_method');

        if(empty($data)){
            return ['error' => 'no data'];
        }

        if(empty($data['alias'])){
            $data['alias'] = $this->transliterate($data['title']);
        }

        $result = $this->one($data['alias'], false);

        if(isset($result->id) && $result->id != $article->id){
            $request->merge(['alias' => $data['alias']]);
            $request->flash();

            return ['error' => 'Данный псевдоним уже используется'];
        }

        if($request->hasFile('image')){
            $image = $request->file('image');

            if($image->isValid()){
                $str = str_random(8);

                $obj = new \stdClass;
                $obj->mini = $str.'_mini.jpg';
                $obj->max = $str.'_max.jpg';
                $obj->path = $str.'.jpg';

                $img = Image::make($image);
                $img->fit(Config::get('settings.image')['width'], Config::get('settings.image')['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->path);

                $img->fit(Config::get('settings.articles_img')['max']['width'], Config::get('settings.articles_img')['max']['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->max);

                $img->fit(Config::get('settings.articles_img')['mini']['width'], Config::get('settings.articles_img')['mini']['height'])->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->mini);

                $data['img'] = json_encode($obj);

            }
        }

        $article->fill($data);
        if($article->update()){
            return ['status' => 'Материал обновлён!'];
        }
    }

    public function deleteArticle($article)
    {
        if(Gate::denies('destroy', $article)){
            abort(403);
        }

        $article->comments()->delete();

        if($article->delete()){
            return ['status' => 'Материал удалён'];
        }
    }
}