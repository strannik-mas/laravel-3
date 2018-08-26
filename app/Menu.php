<?php

namespace Corp;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    //42 урок
    protected $fillable = [
        'title', 'path', 'parent'
    ];

    public function delete(array $options  = [])
    {
        //44 урок
        // this нельзя - он вернет текущую модель $menu
        $child = self::where('parent', $this->id)->delete();
        return parent::delete($options);
    }
}
