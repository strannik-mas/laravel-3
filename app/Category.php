<?php

namespace Corp;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //12 урок
    public function articles()
    {
        return $this->hasMany('Corp\Article');
    }
}
