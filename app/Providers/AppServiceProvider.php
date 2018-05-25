<?php

namespace Corp\Providers;

use function foo\func;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //6 урок
        //@set($i, 10)
        Blade::directive('set', function ($exp){
            list($name, $val) = explode(',', $exp);
            return "<?php $name = $val ?>";
        });

        //15 урок
        //просмотр всех sql запросов
        /*DB::listen(function($query){
            echo '<h1>'.$query->sql.'</h1>';
            echo '<h2>'.print_r($query->bindings).'</h2>';
//            dump($query->sql);
//            dump($query->bindings);
        });*/
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
