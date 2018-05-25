<?php

namespace Corp\Providers;

use Corp\User;
use Illuminate\Support\Facades\Gate;
use Illuminate\Contracts\Auth\Access\Gate as GateContract;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'Corp\Model' => 'Corp\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot(GateContract $gate)
    {
        $this->registerPolicies();

        //30 урок
        $gate->define('VIEW_ADMIN', function (User $user){
            return $user->canDo('VIEW_ADMIN');
//            return $user->canDo(['VIEW_ADMIN', 'ADD_ARTICLES'], true);
        });
        //31 урок
        $gate->define('VIEW_ADMIN_ARTICLES', function (User $user){
            return $user->canDo('VIEW_ADMIN_ARTICLES');
        });
    }
}
