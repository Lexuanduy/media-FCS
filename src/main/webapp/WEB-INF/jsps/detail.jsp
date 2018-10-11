<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detail</title>
</head>
<body>
	<audio id="player" controls>
		<source src="https://storage.cloud.google.com/mymedia-218206.appspot.com/${fileId}.wav" id="audio" />
	</audio>
	<div class="link-file"></div>
	<script>
		function handleFiles(event) {
			var files = event.target.files;
			$("#audio").attr("src", URL.createObjectURL(files[0]));
			document.getElementById("player").load();
			document.getElementById("player").play();
		}
		document.getElementById("file").addEventListener("change", handleFiles,
				false);
	</script>
</body>
</html>