<!DOCTYPE HTML>

<html>
	<head>
		<title>SOS Meta :: Documentación</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets_site/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="#" class="logo"><img src="/images/logob.png"><strong>SOS META :: </strong>Gobernación del Meta</a>
									
								</header>

							<!-- Section -->
								<section>
									<header class="main">
										<h1>{{$page->title}}</h1>
									</header>
								</section>
								<!-- Content -->
							

							
								@foreach ($page->contents as $content)

								<section>
								<h2> {!!$content->title!!}</h2>

									@if (isset($content->image))
									<span class="image main"><img src="{{Voyager::image( $content->image )}}" alt="" /></span>
									@endif
								
									{!!$content->content!!}
									@php
									   $video=json_decode($content->video);
									@endphp
									@if (isset($video[0]))
									
									<span class="image main">
									<video controls style="width: 100%">
										<source src="{{ Storage::disk(config('voyager.storage.disk'))->url($video[0]->download_link) ?: '' }}" type="video/webm">
										
									  </video>
									</span>
									@endif
								</section>
								@endforeach

							
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

				
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Ayuda :: SOSMeta</h2>
									</header>
									<ul>
									@foreach($pages as $p)
										<li><a href="{{route('sitepage',$p->id_page)}}">{{$p->title}}</a></li>
                        			@endforeach    
									</ul>
								</nav>

							

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright"><img src="/images/logo.png"></p>
									<p class="copyright"></p>Gobernación del Meta - Dirección de Gestión del Riesgo y Desastres </p>
									
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/assets_site/js/jquery.min.js"></script>
			<script src="/assets_site/js/browser.min.js"></script>
			<script src="/assets_site/js/breakpoints.min.js"></script>
			<script src="/assets_site/js/util.js"></script>
			<script src="/assets_site/js/main.js"></script>

	</body>
</html>