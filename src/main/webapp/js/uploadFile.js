
	//valid file upload
	var facebookId = null;
	var _validFileExtensions = [ ".wav", ".mp3" ];
	function ValidateSingleInput(oInput) {
		if (oInput.type == "file") {
			var sFileName = oInput.value;
			if (sFileName.length > 0) {
				var blnValid = false;
				for (var j = 0; j < _validFileExtensions.length; j++) {
					var sCurExtension = _validFileExtensions[j];
					if (sFileName.substr(
							sFileName.length - sCurExtension.length,
							sCurExtension.length).toLowerCase() == sCurExtension
							.toLowerCase()) {
						blnValid = true;
						break;
					}
				}

				if (!blnValid) {
					alert("Sorry, " + sFileName
							+ " is invalid, allowed extensions are: "
							+ _validFileExtensions.join(", "));
					oInput.value = "";
					return false;
				}
			}
		}
		return true;
	}

	//play media
	function handleFiles(event) {
		var files = event.target.files;
		$("#audio").attr("src", URL.createObjectURL(files[0]));
		document.getElementById("player").load();
		document.getElementById("player").play();
	}
	document.getElementById("file").addEventListener("change", handleFiles,
			false);

	//upload, show link detail
	var link = "";
	$("#submit").click(function() {
		blob = $("#file")[0].files[0];
		var formData = new FormData();
		formData.append('file', blob);
		console.log("click submit");
		$.ajax({
			url : "/uploadFile?id=" + facebookId,
			type : 'POST',
			data : formData,
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data);
				/* $("#file-link").html("/Detail?fileId=" + data); */
				/* link = "/i?f=" + data; */
				link = "https://media.cec.net.vn/i?f=" + data;
				document.getElementById("file-link").value = link;
				$(".loader").hide();
				$(".share-link").show();
			}
		});
	});
	
	//Share button 
	$("#shareBtn").click(function() {
						console.log("share facebook");
						window.open('http://facebook.com/sharer/sharer.php?u='+ encodeURIComponent(link),'',
										'left=0,top=0,width=650,height=420,personalbar=0,toolbar=0,scrollbars=0,resizable=0');
					});
	$(document).ready(function() {
		$("#file").click(function() {
			$(".submit").show();
			$("#player").show();
		});
		$(".submit").click(function() {
			$(".input-group").show();
			$(".loader").show();
		});
	});

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
	FB.api('/me', function(response) {
	console.log(response); //return facebook Id
	facebookId = response.id;
	
	console.log('Successful login for: ' + response.name);
	document.getElementById('status').innerHTML =
	'Thanks for logging in, ' + response.name + '!';
	});
	}