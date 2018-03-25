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

    public function get()
    {
        $builer = $this->model->select('*');
        return $builer->get();
    }
}