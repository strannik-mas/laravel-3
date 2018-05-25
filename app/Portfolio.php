<?php

namespace Corp;

use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    //7 урок
    public function filter()
    {
        return $this->belongsTo('Corp\Filter', 'filter_alias', 'alias');
    }
}
