<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<a href="https://media.cec.net.vn">Record now >></a>
				</div>
			</div>
			<div class="header">
				<div id="fb-root">
					<fb:login-button data-max-rows="1" data-size="small"
						data-button-type="continue_with" data-show-faces="true"
						data-auto-logout-link="true" data-use-continue-as="true"
						scope="public_profile,email" onlogin="checkLoginState();">
					</fb:login-button>
					<div id="status"></div>
					<div class="list-files">
					
					</div>
				</div>
			</div>
			<div class="input-group">
				<div class="row share-link">
					<div class="col-sm-4" style="padding-left: 0;">
						<p class="sharing-option">Sharing:</p>
					</div>
					<div class="col-sm-8" style="padding-left: 23px">
						<input type="text" id="file-link" class="form-control"
							placeholder="For sharing..." value="" aria-label="For sharing"
							aria-describedby="basic-addon1">
					</div>
				</div>
				<div class="shareHorizontalSeparator"></div>
				<div class="share-button">
					<!-- <button type="button" id="shareBtn" title="share facebok" clearfix"> -->
					<a id="shareBtn"
						class="addthis_button_facebook addthis_button_preferred_1 at300b"
						title="Facebook" href="#"><span class="at-icon-wrapper"
						style="background-color: rgb(59, 89, 152); line-height: 32px; height: 32px; width: 32px;"><svg
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
								version="1.1" role="img" aria-labelledby="at-svg-facebook-2"
								title="Facebook" alt="Facebook"
								style="width: 32px; background-color: rgb(59, 89, 152); height: 32px;"
								class="at-icon at-icon-facebook">
								<title id="at-svg-facebook-2">Facebook</title><g>
								<path
									d="M22 5.16c-.406-.054-1.806-.16-3.43-.16-3.4 0-5.733 1.825-5.733 5.17v2.882H9v3.913h3.837V27h4.604V16.965h3.823l.587-3.913h-4.41v-2.5c0-1.123.347-1.903 2.198-1.903H22V5.16z"
									fill-rule="evenodd" style="fill: #fff;"></path></g></svg></span> </a>
					<!-- </button> -->
				</div>
			</div>
			<div class="loader-content">
				<div class="loader"></div>
			</div>

			<p class="voice-media">My media - The premier voice recording
				service.</p>
			<div class="form-upload">
				<div class="select-file">
					<div class="input-file">
						<input type="file" name="file" id="file"
							onchange="ValidateSingleInput(this);" />
					</div>
				</div>
				<audio id="player" data-toggle="tooltip" data-placement="left"
					title="play" controls>
					<source src="" id="audio" />
				</audio>
				<div class="submit">
					<div class="row">
						<div class="col-sm-4" style="padding: 10px 0px 0px 75px;">Upload:</div>
						<div class="col-sm-8" style="padding: 6px 0px 0px 31px;">
							<button type="button" id="submit" data-toggle="tooltip"
								data-placement="left" title="upload to server"
								class="btn-submit button disabled one btn btn-outline-info"
								style="width: 60px; height: 40px;">
								<i class="fas fa-upload"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="shareMedia">
				<!-- <div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">URL</span>
					</div>
					<input type="text" title="For sharing..." id="file-link" value=""
						class="form-control" aria-describedby="basic-addon1">
				</div> -->
			</div>
			<div class="size-file">Most common audio formats supported
				(view). Max size 50 MB. Please do not upload copyrighted music etc.</div>
			<!-- <button type="button" id="shareBtn" data-toggle="tooltip"
				data-placement="left" title="share facebook"
				class="btn btn-primary clearfix">
				<i class="fab fa-facebook"></i>
			</button> -->
		</div>
	</div>
	</div>
	<script src="../js/uploadFile.js"></script>
</body>
</html>