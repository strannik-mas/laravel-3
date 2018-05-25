<?php


namespace Corp\Repositories;

use Corp\Article;


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
}