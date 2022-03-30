<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<style type="text/css">
		@page {
			margin: 0px;
			page-​break-after: avoid;
		}
		html {
			margin: 0px;
			page-​break-after: avoid;
		}
		body {
			padding: 0px;
			margin: 0px;
			background-color: #EAF4FF;
			user-select: none;
			page-​break-after: avoid;
		}
		* {
			box-sizing: border-box;
			margin: 0px;
			padding: 0px;
			page-​break-after: avoid;
		}
		img	{
			width: 100%;
			max-width: 100%;
		}
		.container {
			width: 100%;
			height: 100%;
			margin: 0 auto;
			background-repeat: no-repeat;
			background-position: center top;
			background-size: contain;
		}
	</style>
</head>
<body>
	{{-- <div class="container"></div> --}}
	@forelse ($pdfs as $pdf)
		<div class="container" style="background-image: url({{ $pdf }})"></div>
	@empty

	@endforelse
</body>
</html>