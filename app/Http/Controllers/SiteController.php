<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\SiteTemplate;
use App\Models\SitePage;
use App\Models\SiteInfo;

class SiteController extends Controller
{
    //
    public function index()
    {
        $id=1;
        $info=SiteInfo::first();
        $page=SitePage::find($id);
        $pages=SitePage::where("show_menu","=","1")->orderBy("sort")->get();
        $view="site.{$page->template->template}";
        return view($view,compact("page","info","pages"));
    }
    public function page($id)
    {
        $info=SiteInfo::first();
        $page=SitePage::find($id);
        $pages=SitePage::where("show_menu","=","1")->orderBy("sort")->get();
        $view="site.{$page->template->template}";
        return view($view,compact("page","info","pages"));
    }
}
