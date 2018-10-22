<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1" />
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
<title>All Files</title>
</head>
<body>
	<div class="container">
		<div class="container content">
			<div class="upload-return">
				<div class="upload-text">
					<h2>All Files</h2>
				</div>
				<div class="record-link">
					<a href="https://media.cec.net.vn">Record now >></a>
				</div>
				<div class="header">
					<div id="fb-root">
						<fb:login-button data-max-rows="1" data-size="small"
							data-button-type="continue_with" data-show-faces="true"
							data-auto-logout-link="true" data-use-continue-as="true"
							scope="public_profile,email" onlogin="checkLoginState();">
						</fb:login-button>
						<div id="status"></div>
					</div>
				</div>
				<div class="all-listFiles">
					<div class="listFiles-title">List all files:</div>
					<div class="all-files">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">A list of all the files that have been uploaded to the website</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td colspan="2"></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script>
			//check status response
			function statusChangeCallback(response) {
				console.log('statusChangeCallback');
				console.log(response);
				if (response.status === 'connected') {
					// Logged into your app and Facebook.
					testAPI();
				} else {
					// The person is not logged into your app or we are unable to tell.
					document.getElementById('status').innerHTML = 'Please log '
							+ 'into this app.';
				}
			}
			function checkLoginState() {
				FB.getLoginStatus(function(response) {
					statusChangeCallback(response);
				});
			}

			window.fbAsyncInit = function() {
				FB.init({
					appId : '{your-app-id}',
					cookie : true, // enable cookies to allow the server to access 
					// the session
					xfbml : true, // parse social plugins on this page
					version : 'v2.8' // use graph api version 2.8
				});
				FB.getLoginStatus(function(response) {
					statusChangeCallback(response);
				});

			};

			// Load the SDK asynchronously
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id))
					return;
				js = d.createElement(s);
				js.id = id;
				js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.1&appId=1326545090735920&autoLogAppEvents=1';
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));

			//Facebook API 
			function testAPI() {
				console.log('Welcome!  Fetching your information.... ');
				FB
						.api(
								'/me',
								function(response) {
									console.log(response); //return facebook Id
									facebookId = response.id;

									console.log('Successful login for: '
											+ response.name);
									document.getElementById('status').innerHTML = 'Thanks for logging in, '
											+ response.name + '!';
								});
			}
		</script>
</body>
</html>