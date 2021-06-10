<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;
use App\LocationFormField;
use App\PassFormField;
use App\EmailFormField;
use App\HtmlFormField;
use App\ListSelectFormField;
use App\CascadeFormField;
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
        Voyager::addFormField(PassFormField::class);
        Voyager::addFormField(EmailFormField::class);
        Voyager::addFormField(HtmlFormField::class);
        Voyager::addFormField(CascadeFormField::class);
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
