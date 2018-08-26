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

    public function hasPermission($name, $require = false)
    {
        if(is_array($name)){
            foreach ($name as $permissionName){
                $permission = $this->hasPermission($permissionName);

                if($permission && !$require){
                    return true;
                }elseif (!$permission && $require){
                    return false;
                }
            }
            return $require;
        }else{
            foreach ($this->perms()->get() as $permission){
                if($permission->name == $name){
                    return true;
                }
            }
            return false;
        }
    }

    public function savePermissions($inputPermissions)
    {
        //39 урок
        if(!empty($inputPermissions)){
            $this->perms()->sync($inputPermissions);
        }else{
            $this->perms()->detach();
        }

        return true;
    }
}
