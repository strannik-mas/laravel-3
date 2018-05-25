<?php
/**
 * Created by PhpStorm.
 * User: Alex
 * Date: 25.03.2018
 * Time: 18:53
 */

namespace Corp\Repositories;
use Config;

abstract class Repository
{
    protected $model = false;

    public function get($select = '*', $take = false, $pagination = false, $where = false)
    {
        $builer = $this->model->select($select);
        if($take){
            $builer->take($take);
        }

        /*16 урок*/
        if($where){
            $builer->where($where[0], $where[1]);
        }
        /*конец 16 урока*/

        //11 урок
        if($pagination){
            return $this->check($builer->paginate(Config::get('settings.paginate')));
        }

        return $this->check($builer->get());
    }

    protected function check($result)
    {
        if($result->isEmpty()){
            return false;
        }
        $result->transform(function($item, $key){
            if(is_string($item->img) && is_object(json_decode($item->img)) && json_last_error() == JSON_ERROR_NONE)
                $item->img = json_decode($item->img);
            return $item;
        });
        return $result;
    }

    //16 урок
    public function one($alias, $attr = [])
    {
        return $this->model->where('alias', $alias)->first();
    }
}