<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description"
	content="Responsive &amp; Touch-Friendly Audio Player" />
<meta name="author" content="Osvaldas Valutis, www.osvaldas.info" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="asset/css/styleDetail.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Lato:400,700" />
<!-- <link rel="shortcut icon" href="../favicon.ico"> -->
<link rel="stylesheet" href="asset/css/reset.css" />
<link rel="stylesheet" href="asset/css/demo.css" />
<link rel="stylesheet" href="asset/css/audioplayer.css" />
<script>
	/*
		VIEWPORT BUG FIX
		iOS viewport scaling bug fix, by @mathias, @cheeaun and @jdalton
	 */
	(function(doc) {
		var addEvent = 'addEventListener', type = 'gesturestart', qsa = 'querySelectorAll', scales = [
				1, 1 ], meta = qsa in doc ? doc[qsa]('meta[name=viewport]')
				: [];
		function fix() {
			meta.content = 'width=device-width,minimum-scale=' + scales[0]
					+ ',maximum-scale=' + scales[1];
			doc.removeEventListener(type, fix, true);
		}
		if ((meta = meta[meta.length - 1]) && addEvent in doc) {
			fix();
			scales = [ .25, 1.6 ];
			doc[addEvent](type, fix, true);
		}
	}(document));
</script>
<title>Detail</title>
</head>
<body>
	<div class="container">
		<div class="container content">
			<!--/ Codrops top bar -->
			<h1>
				Audio Player
			</h1>
			<h2>My media - The premier voice recording service.</h2>
			<div id="wrapper">
				<audio preload="auto" controls>
					<source src="https://mymedia-218206.appspot.com/${f}.wav">
				</audio>
				<script src="js/jquery.js"></script>
				<script src="js/audioplayer.js"></script>
				<script>
					$(function() {
						$('audio').audioPlayer();
					});
				</script>
			</div>
		</div>
	</div>
	<%-- <div class="container">
		<div class="container content">
			<h2>Play</h2>
			<p class="voice-media">My media - The premier voice recording service.</p>
			<audio id="player" controls>
				<source
					src="https://mymedia-218206.appspot.com/${f}.wav"
					id="audio" />
			</audio>
			<embed src="https://mymedia-218206.appspot.com/${f}.wav" width="220" height="140" type="application/x-shockwave-flash" pluginspage="http://get.adobe.com/flashplayer/">
			<!-- <div class="bottom">© 2018
			<a href="https://mymedia-218206.appspot.com">My media</a>
			</div> -->
		</div>
	</div>
	<script>
		function handleFiles(event) {
			var files = event.target.files;
			$("#audio").attr("src", URL.createObjectURL(files[0]));
			document.getElementById("player").load();
			document.getElementById("player").play();
		}
		document.getElementById("file").addEventListener("change", handleFiles,
				false);
	</script> --%>
</body>
</html>