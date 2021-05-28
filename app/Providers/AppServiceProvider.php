<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;
use App\LocationFormField;
use App\ListSelectFormField;
use App\Actions\PrintAction;
use App\Actions\DocxAction;
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
        Voyager::addAction(DocxAction::class);
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
