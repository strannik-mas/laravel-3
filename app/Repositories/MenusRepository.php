<?php
/**
 * Created by PhpStorm.
 * User: Alex
 * Date: 25.03.2018
 * Time: 18:52
 */

namespace Corp\Repositories;
use Corp\Menu;

class MenusRepository extends Repository
{
    public function __construct(Menu $menu)
    {
        $this->model = $menu;
    }
}