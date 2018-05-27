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

    public function transliterate($string)
    {
        //33 урок
        $str = mb_strtolower($string, 'UTF-8');

        $leter_array = array(
            'a' => 'а',
            'b' => 'б',
            'v' => 'в',
            'g' => 'г,ґ',
            'd' => 'д',
            'e' => 'е,є,э',
            'jo' => 'ё',
            'zh' => 'ж',
            'z' => 'з',
            'i' => 'и,і',
            'ji' => 'ї',
            'j' => 'й',
            'k' => 'к',
            'l' => 'л',
            'm' => 'м',
            'n' => 'н',
            'o' => 'о',
            'p' => 'п',
            'r' => 'р',
            's' => 'с',
            't' => 'т',
            'u' => 'у',
            'f' => 'ф',
            'kh' => 'х',
            'ts' => 'ц',
            'ch' => 'ч',
            'sh' => 'ш',
            'shch' => 'щ',
            '' => 'ъ',
            'y' => 'ы',
            '' => 'ь',
            'yu' => 'ю',
            'ya' => 'я',
        );

        foreach ($leter_array as $letter => $kyr){
            $kyr = explode(',',$kyr);

            $str = str_replace($kyr, $letter, $str);
        }

        $str = preg_replace('/(\s|[^A-Za-z0-9\-])+/', '-', $str);
        $str = trim($str, '-');
        return $str;
    }
}