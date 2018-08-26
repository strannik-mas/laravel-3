<?php

namespace Corp;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'login'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function articles()
    {
        return $this->hasMany('Corp\Article');
    }

    public function comments()
    {
        return $this->hasMany('Corp\User');
    }

    public function roles()
    {
        return $this->belongsToMany('Corp\Role', 'role_user');
    }

    /**
     * 30 урок
     * @param string / array $permission
     * @param bool $require     В случае true все перечисленные разрешения должны быть у пользователя, чтобы метод вернул true
     */
    public function canDo($permission, $require = false)
    {
        if(is_array($permission)){
            foreach ($permission as $permName){
                $permName = $this->canDo($permName);
                if($permName && !$require){
                    return true;
                }elseif (!$permName && $require){
                    return false;
                }
            }
            return $require;
        }else{
            foreach ($this->roles as $role){
                foreach ($role->perms as $perm){
                    if(str_is($permission, $perm->name)){
                        return true;
                    }
                }
            }
            return false;
        }
    }

    public function hasRole($name, $require = false)
    {
        if(is_array($name)){
            foreach ($name as $roleName){
                $roleName = $this->hasRole($roleName);

                if($roleName && !$require){
                    return true;
                }elseif (!$roleName && $require){
                    return false;
                }
            }
            return $require;
        }else{
            foreach ($this->roles as $role){
                foreach ($role->name as $role){
                    if($role->name == $name){
                        return true;
                    }
                }
            }
            return false;
        }
    }
}
