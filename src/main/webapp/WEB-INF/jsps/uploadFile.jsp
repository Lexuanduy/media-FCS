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
			<div class="sharing-options">
				Sharing options:
				<div class="logo-share">
					<div id="shareBtn"
						class="addthis_toolbox addthis_default_style addthis_32x32_style">
						<a
							class="addthis_button_facebook addthis_button_preferred_1 at300b"
							title="Facebook" href="#"> <span class="at-icon-wrapper"
							style="background-color: rgb(59, 89, 152); line-height: 32px; height: 32px; width: 32px;">
								<svg xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
									version="1.1" role="img" aria-labelledby="at-svg-facebook-2"
									title="Facebook" alt="Facebook"
									style="width: 32px; height: 32px; background-color: #3B5998;"
									class="at-icon at-icon-facebook">
									<title id="at-svg-facebook-2">Facebook</title>
									<g>
										<path
										d="M22 5.16c-.406-.054-1.806-.16-3.43-.16-3.4 0-5.733 1.825-5.733 5.17v2.882H9v3.913h3.837V27h4.604V16.965h3.823l.587-3.913h-4.41v-2.5c0-1.123.347-1.903 2.198-1.903H22V5.16z"
										fill-rule="evenodd">
										</path>
									</g>
								</svg>
						</span>
						</a> <a
							class="addthis_button_twitter addthis_button_preferred_2 at300b"
							title="Twitter" href="#"><span class="at-icon-wrapper"
							style="background-color: rgb(29, 161, 242); line-height: 32px; height: 32px; width: 32px;"><svg
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
									version="1.1" role="img" aria-labelledby="at-svg-twitter-3"
									title="Twitter" alt="Twitter"
									style="width: 32px; height: 32px; background-color: #1DA1F2;"
									class="at-icon at-icon-twitter">
								<title id="at-svg-twitter-3">Twitter</title><g>
								<path
										d="M27.996 10.116c-.81.36-1.68.602-2.592.71a4.526 4.526 0 0 0 1.984-2.496 9.037 9.037 0 0 1-2.866 1.095 4.513 4.513 0 0 0-7.69 4.116 12.81 12.81 0 0 1-9.3-4.715 4.49 4.49 0 0 0-.612 2.27 4.51 4.51 0 0 0 2.008 3.755 4.495 4.495 0 0 1-2.044-.564v.057a4.515 4.515 0 0 0 3.62 4.425 4.52 4.52 0 0 1-2.04.077 4.517 4.517 0 0 0 4.217 3.134 9.055 9.055 0 0 1-5.604 1.93A9.18 9.18 0 0 1 6 23.85a12.773 12.773 0 0 0 6.918 2.027c8.3 0 12.84-6.876 12.84-12.84 0-.195-.005-.39-.014-.583a9.172 9.172 0 0 0 2.252-2.336"
										fill-rule="evenodd"></path></g></svg>
								<div class="atclear"></div>
					</div>
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

.sharing-options {
	width: 100%;
	margin: 8px 0 0 0;
	float: left;
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
			blob = $("#file")[0].files[0];
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
					$("#file-link").html("https://mymedia-218206.appspot.com/Detail/" + data);
				}
			});
		});
	</script>
</body>
</html>