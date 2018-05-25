<?php

namespace Corp;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //29 урок
    public function users()
    {
        return $this->belongsToMany('Corp\User', 'role_user');
    }

    public function perms()
    {
        return $this->belongsToMany('Corp\Permission'); //второй аргумент можно опустить , 'permission_role'
    }
}
