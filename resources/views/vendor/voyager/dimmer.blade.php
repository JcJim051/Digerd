<style>
			.wrapper {
				width: 500px;
			}

			.progress-bar {
				width: 100%;
				background-color: #ffffff;
				padding: 3px;
				border-radius: 3px;
				box-shadow: inset 0 1px 3px rgba(0, 0, 0, .2);
			}

			.progress-bar-fill {
				display: block;
				height: 22px;
				background-color: #659cef;
				border-radius: 3px;
				transition: width 500ms ease-in-out;
			}
		</style>
<div class="panel widget center bgimage" style="margin-bottom:0;overflow:hidden;background-image:url('{{ $image }}');">
    <div class="dimmer"></div>
    <div class="panel-content">
        @if (isset($icon))<i class='{{ $icon }}'></i>@endif
        <h4>{!! $title !!}</h4>
        <p>{!! $text !!}</p>
        <p><a href="{{ $button['link'] }}" class="btn btn-primary " style="background-color: {{$button['color']}}">{!! $button['text'] !!}</a></p>

			<div class="progress-bar">
				<span class="progress-bar-fill" style="width: {{$percent}}%; background-color: {{$bgcolor}}; color: #000000">{{$percent}}%</span>
			</div>

    </div>
</div>
