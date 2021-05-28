<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;
use App\LocationFormField;
use App\ListSelectFormField;
use App\Actions\PrintAction;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Voyager::addFormField(LocationFormField::class);
        Voyager::addFormField(ListSelectFormField::class);
        Voyager::addAction(PrintAction::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
