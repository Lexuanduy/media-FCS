<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/jquery.js"></script>
<title>Upload Files</title>
</head>
<body>
	<div class="container">
		<div class="container content">
			<div class="error-message"
				style="padding: 5px; color: red; font-style: italic;">
				${errorMessage}</div>

			<h2 class="upload-text">Upload Files</h2>

			<div class="form-upload">
				<div class="select-file">
					Select file to upload:
					<div class="input-file">
						<input type="file" name="file" id="file" />
					</div>
				</div>
				<audio id="player" controls>
					<source src="" id="audio" />
				</audio>
				<div class="submit">
					<button id="submit" class="btn-submit">Upload</button>
				</div>
			</div>
			<div class="shareMedia">
				<div id="file-link"></div>
			</div>
		</div>
	</div>
	<style>
.container {
	width: 100%;
	margin: 0 auto;
}

.content {
	width: 30%;
	margin: 0 auto center;
}

.error-message {
	width: 100%;
	margin: 5px 0 5px 0;
	float: left;
}

.upload-text {
	width: 100%;
	float: left;
	margin-bottom: 30px;
	color: chocolate;
}

.form-upload {
	width: 100%;
	margin: 0 auto;
	float: left;
}

.select-file {
	width: 100%;
	margin: 0 0 5px 0;
	float: left;
}

.input-file {
	width: 100%;
	margin: 5px 0 15px 0;
	float: left;
}

#player {
	width: 100%;
	float: left;
	margin: 3px 0 8px 0;
}

.submit {
	width: 100%;
	float: left;
	margin: 0 auto;
}

.shareMedia {
	width: 100%;
	float: left;
	margin: 8px 0 8px 0;
}

#idShareMediaLink {
	width: 100%;
}

#file-link {
	width: 100%;
	margin: 0 auto;
	float: left;
}
</style>
	<script>
		function handleFiles(event) {
			var files = event.target.files;
			$("#audio").attr("src", URL.createObjectURL(files[0]));
			document.getElementById("player").load();
			document.getElementById("player").play();
		}
		document.getElementById("file").addEventListener("change", handleFiles,
				false);

		$("#submit").click(function() {
			blob = $("#file")[0].files;
			var formData = new FormData();
			formData.append('file', blob);
			console.log("click submit");
			$.ajax({
				url : "/uploadFile",
				type : 'POST',
				data : formData,
				contentType : false,
				processData : false,
				success : function(data) {
					console.log(data);
					$("#file-link").html(data);
				}
			});
		});
	</script>
</body>
</html>