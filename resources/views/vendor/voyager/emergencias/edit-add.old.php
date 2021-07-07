@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                @if ($add)
                <div class="panel panel-bordered">


                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach

                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                            <a href={{ URL::previous() }}><button type="button" class="btn btn-secondary save">Cancelar</button></a>
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            @else
            <div class="panel">

                
            <div class="page-content settings container-fluid">
                    <ul class="nav nav-tabs">
                                                    <li class="active">
                                <a data-toggle="tab" href="#site" aria-expanded="true">Site</a>
                            </li>
                                                    <li class="">
                                <a data-toggle="tab" href="#admin" aria-expanded="false">Admin</a>
                            </li>
                                            </ul>

                    <div class="tab-content">
                                                <div id="site" class="tab-pane fade active in">
                                                        <div class="panel-heading">
                                <h3 class="panel-title">
                                    Site Title <code>setting('site.title')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/1/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/1/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="1" data-display-key="site.title" data-display-name="Site Title"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="site.title" value="Site Title">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="site.title_group" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin">Admin</option>
                                                                                <option value="Site" selected="" data-select2-id="3">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="2" style="width: 249.304px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-sitetitle_group-2i-container"><span class="select2-selection__rendered" id="select2-sitetitle_group-2i-container" role="textbox" aria-readonly="true" title="Site">Site</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Site Description <code>setting('site.description')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/2/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/2/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="2" data-display-key="site.description" data-display-name="Site Description"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="site.description" value="Site Description">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="site.description_group" data-select2-id="4" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin">Admin</option>
                                                                                <option value="Site" selected="" data-select2-id="6">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="5" style="width: 249.304px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-sitedescription_group-nk-container"><span class="select2-selection__rendered" id="select2-sitedescription_group-nk-container" role="textbox" aria-readonly="true" title="Site">Site</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Site Logo <code>setting('site.logo')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/3/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/3/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="3" data-display-key="site.logo" data-display-name="Site Logo"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                                                                    <input type="file" name="site.logo">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="site.logo_group" data-select2-id="7" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin">Admin</option>
                                                                                <option value="Site" selected="" data-select2-id="9">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="8" style="width: 249.304px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-sitelogo_group-ct-container"><span class="select2-selection__rendered" id="select2-sitelogo_group-ct-container" role="textbox" aria-readonly="true" title="Site">Site</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Google Analytics Tracking ID <code>setting('site.google_analytics_tracking_id')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/4/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/4/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="4" data-display-key="site.google_analytics_tracking_id" data-display-name="Google Analytics Tracking ID"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="site.google_analytics_tracking_id" value="">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="site.google_analytics_tracking_id_group" data-select2-id="10" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin">Admin</option>
                                                                                <option value="Site" selected="" data-select2-id="12">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="11" style="width: 249.304px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-sitegoogle_analytics_tracking_id_group-ty-container"><span class="select2-selection__rendered" id="select2-sitegoogle_analytics_tracking_id_group-ty-container" role="textbox" aria-readonly="true" title="Site">Site</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                                                </div>
                                                <div id="admin" class="tab-pane fade">
                                                        <div class="panel-heading">
                                <h3 class="panel-title">
                                    Admin Title <code>setting('admin.title')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/6/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/6/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="6" data-display-key="admin.title" data-display-name="Admin Title"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="admin.title" value="SOS Meta :: Panel de administración">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.title_group" data-select2-id="13" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="15">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="14" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-admintitle_group-zj-container"><span class="select2-selection__rendered" id="select2-admintitle_group-zj-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Google Analytics Client ID (used for admin dashboard) <code>setting('admin.google_analytics_client_id')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/10/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/10/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="10" data-display-key="admin.google_analytics_client_id" data-display-name="Google Analytics Client ID (used for admin dashboard)"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="admin.google_analytics_client_id" value="">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.google_analytics_client_id_group" data-select2-id="16" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="18">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="17" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-admingoogle_analytics_client_id_group-of-container"><span class="select2-selection__rendered" id="select2-admingoogle_analytics_client_id_group-of-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Admin Description <code>setting('admin.description')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/7/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/7/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="7" data-display-key="admin.description" data-display-name="Admin Description"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                            <input type="text" class="form-control" name="admin.description" value="Bienvenido a la plataforma SOS Meta">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.description_group" data-select2-id="19" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="21">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="20" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-admindescription_group-qq-container"><span class="select2-selection__rendered" id="select2-admindescription_group-qq-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Admin Loader <code>setting('admin.loader')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/8/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/8/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="8" data-display-key="admin.loader" data-display-name="Admin Loader"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                                                                    <input type="file" name="admin.loader">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.loader_group" data-select2-id="22" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="24">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="23" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-adminloader_group-5c-container"><span class="select2-selection__rendered" id="select2-adminloader_group-5c-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Admin Icon Image <code>setting('admin.icon_image')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/9/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/9/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="9" data-display-key="admin.icon_image" data-display-name="Admin Icon Image"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                                                                        <div class="img_settings_container">
                                                <a href="http://localhost:8000/admin/settings/9/delete_value" class="voyager-x delete_value"></a>
                                                <img src="http://localhost:8000/storage/settings/May2021/wcG1qLqlH2O5REHBAamv.png" style="width:200px; height:auto; padding:2px; border:1px solid #ddd; margin-bottom:10px;">
                                            </div>
                                            <div class="clearfix"></div>
                                                                                <input type="file" name="admin.icon_image">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.icon_image_group" data-select2-id="25" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="27">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="26" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-adminicon_image_group-j5-container"><span class="select2-selection__rendered" id="select2-adminicon_image_group-j5-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                            <hr>
                                                                                    <div class="panel-heading">
                                <h3 class="panel-title">
                                    Admin Background Image <code>setting('admin.bg_image')</code>                                </h3>
                                <div class="panel-actions">
                                    <a href="http://localhost:8000/admin/settings/5/move_up">
                                        <i class="sort-icons voyager-sort-asc"></i>
                                    </a>
                                    <a href="http://localhost:8000/admin/settings/5/move_down">
                                        <i class="sort-icons voyager-sort-desc"></i>
                                    </a>
                                                                        <i class="voyager-trash" data-id="5" data-display-key="admin.bg_image" data-display-name="Admin Background Image"></i>
                                                                    </div>
                            </div>

                            <div class="panel-body no-padding-left-right">
                                <div class="col-md-10 no-padding-left-right">
                                                                                                                        <div class="img_settings_container">
                                                <a href="http://localhost:8000/admin/settings/5/delete_value" class="voyager-x delete_value"></a>
                                                <img src="http://localhost:8000/storage/settings/May2021/HaUB0ssbaqo7NN5mAnio.jpg" style="width:200px; height:auto; padding:2px; border:1px solid #ddd; margin-bottom:10px;">
                                            </div>
                                            <div class="clearfix"></div>
                                                                                <input type="file" name="admin.bg_image">
                                                                    </div>
                                <div class="col-md-2 no-padding-left-right">
                                    <select class="form-control group_select select2-hidden-accessible" name="admin.bg_image_group" data-select2-id="28" tabindex="-1" aria-hidden="true">
                                                                                <option value="Admin" selected="" data-select2-id="30">Admin</option>
                                                                                <option value="Site">Site</option>
                                                                            </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="29" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-adminbg_image_group-jz-container"><span class="select2-selection__rendered" id="select2-adminbg_image_group-jz-container" role="textbox" aria-readonly="true" title="Admin">Admin</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                </div>
                            </div>
                                                                                </div>
                                            </div>
                </div>
                </div>
            @endif


            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@stop
