<?php
/**
 * Created by PhpStorm.
 * User: Alex
 * Date: 26.03.2018
 * Time: 22:43
 */

namespace Corp\Repositories;
use Corp\Slider;

class SlidersRepository extends Repository
{
    public function __construct(Slider $slider)
    {
        $this->model = $slider;
    }
}