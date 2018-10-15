<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="asset/css/styleUpload.css">
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
			<div class="upload-return">
				<div class="upload-text">
					<h2>Upload Files</h2>
				</div>
				<div class="record-link">
					<a href="https://mymedia-218206.appspot.com">Or record ?</a>
				</div>
			</div>
			<p>My media - The premier voice recording service.</p>
			<div class="form-upload">
				<div class="select-file">
					Select file to upload:
					<div class="input-file">
						<input type="file" name="file" id="file" />
					</div>
				</div>
				<audio id="player" data-toggle="tooltip" data-placement="left"
					title="play" controls>
					<source src="" id="audio" />
				</audio>
				<div class="submit">
					<button type="button" id="submit" data-toggle="tooltip"
						data-placement="left" title="upload to server"
						class="btn-submit button disabled one btn btn-outline-info">
						<i class="fas fa-upload"></i>
					</button>
				</div>
			</div>
			<div class="shareMedia">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">URL</span>
					</div>
					<input type="text" title="For sharing..." id="file-link" value=""
						class="form-control" aria-describedby="basic-addon1">
				</div>
			</div>
			<button type="button" id="shareBtn" data-toggle="tooltip"
				data-placement="left" title="share facebook"
				class="btn btn-primary clearfix">
				<i class="fab fa-facebook"></i>
			</button>
			</div>
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
		var link = "";
		$("#submit")
				.click(
						function() {
							blob = $("#file")[0].files[0];
							var formData = new FormData();
							formData.append('file', blob);
							console.log("click submit");
							$
									.ajax({
										url : "/uploadFile",
										type : 'POST',
										data : formData,
										contentType : false,
										processData : false,
										success : function(data) {
											console.log(data);
											/* $("#file-link").html("/Detail?fileId=" + data); */
											link = "https://mymedia-218206.appspot.com/Detail?fileId="
													+ data;
											document
													.getElementById("file-link").value = link;
										}
									});
						});
		//Share button 
		$("#shareBtn")
				.click(
						function() {
							console.log("share facebook");
							window
									.open(
											'http://facebook.com/sharer/sharer.php?u='
													+ encodeURIComponent(link),
											'',
											'left=0,top=0,width=650,height=420,personalbar=0,toolbar=0,scrollbars=0,resizable=0');
						});
	</script>
</body>
</html>