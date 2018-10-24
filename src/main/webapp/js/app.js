function restore(){
  $("#record, #live").removeClass("disabled");
  $("#pause").replaceWith('<button type="button" id="pause" class="button one btn btn-secondary">Pause</button>');
  $(".one").addClass("disabled");
  Fr.voice.stop();
}

function makeWaveform(){
  var analyser = Fr.voice.recorder.analyser;

  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);

  /**
	 * The Waveform canvas
	 */
  var WIDTH = 500,
      HEIGHT = 200;

  var canvasCtx = $("#level")[0].getContext("2d");
  canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

  function draw() {
    var drawVisual = requestAnimationFrame(draw);

    analyser.getByteTimeDomainData(dataArray);

    canvasCtx.fillStyle = 'rgb(200, 200, 200)';
    canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);
    canvasCtx.lineWidth = 2;
    canvasCtx.strokeStyle = 'rgb(0, 0, 0)';

    canvasCtx.beginPath();

    var sliceWidth = WIDTH * 1.0 / bufferLength;
    var x = 0;
    for(var i = 0; i < bufferLength; i++) {
      var v = dataArray[i] / 128.0;
      var y = v * HEIGHT/2;

      if(i === 0) {
        canvasCtx.moveTo(x, y);
      } else {
        canvasCtx.lineTo(x, y);
      }

      x += sliceWidth;
    }
    canvasCtx.lineTo(WIDTH, HEIGHT/2);
    canvasCtx.stroke();
  };
  draw();
}

$(document).ready(function(){
  $(document).on("click", "#record:not(.disabled)", function(){
    Fr.voice.record($("#live").is(":checked"), function(){
      $(".recordButton").addClass("disabled");

      $("#live").addClass("disabled");
      $(".one").removeClass("disabled");

      makeWaveform();
    });
  });

  $(document).on("click", "#recordFor5:not(.disabled)", function(){
    Fr.voice.record($("#live").is(":checked"), function(){
      $(".recordButton").addClass("disabled");

      $("#live").addClass("disabled");
      $(".one").removeClass("disabled");

      makeWaveform();
    });

    Fr.voice.stopRecordingAfter(5000, function(){
      alert("Recording stopped after 5 seconds");
    });
  });

  $(document).on("click", "#pause:not(.disabled)", function(){
    if($(this).hasClass("resume")){
      Fr.voice.resume();
      $(this).replaceWith('<button type="button" id="pause" class="button one btn btn-secondary">Pause</button>');
    }else{
      Fr.voice.pause();
      $(this).replaceWith('<button type="button" id="pause" class="button one resume btn btn-info">Resume</button>');
    }
  });

  $(document).on("click", "#stop:not(.disabled)", function(){
    restore();
  });

  $(document).on("click", "#play:not(.disabled)", function(){
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(function(url){
        $("#audio").attr("src", url);
        $("#audio")[0].play();
      }, "URL");
    }else{
      Fr.voice.export(function(url){
        $("#audio").attr("src", url);
        $("#audio")[0].play();
      }, "URL");
    }
    restore();
  });

  $(document).on("click", "#download:not(.disabled)", function(){
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(function(url){
        $("<a href='" + url + "' download='MyRecording.mp3'></a>")[0].click();
      }, "URL");
    }else{
      Fr.voice.export(function(url){
        $("<a href='" + url + "' download='MyRecording.wav'></a>")[0].click();
      }, "URL");
    }
    restore();
  });

  $(document).on("click", "#base64:not(.disabled)", function(){
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(function(url){
        console.log("Here is the base64 URL : " + url);
        alert("Check the web console for the URL");

        $("<a href='"+ url +"' target='_blank'></a>")[0].click();
      }, "base64");
    }else{
      Fr.voice.export(function(url){
        console.log("Here is the base64 URL : " + url);
        alert("Check the web console for the URL");

        $("<a href='"+ url +"' target='_blank'></a>")[0].click();
      }, "base64");
    }
    restore();
  });
  
  // facebook
  var facebookId = null;
	$(document).ready(function() {
		$("#record").click(function() {
			$("#level").show();
		});
		$("#save").click(function() {
			$(".input-group").show();
			$("#level").hide();
			$(".loader").show();
		});
		$("#play").click(function() {
			$("#audio").show();
		});
		$("#pause").click(function() {
			$(".wav-controls").show();
		});
	});

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			$("#list-files").show();
			$(".files-uploaded").show();
			testAPI();
		} else {
			$("#list-files").hide();
			$(".files-uploaded").hide();
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
	//

	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		FB.api('/me', function(response) {
		console.log('Successful login for: ' + response.name);
		console.log(response);
		facebookId = response.id;
		$.ajax({
	        url: "/hello?id=" + facebookId,
	        type: 'GET',
	        contentType: false,
	        processData: false,
	        success: function(url) {
	        	console.log(url);
      	        /*link = "https://media.cec.net.vn/i?f=" + url;*/
	      	    document.getElementById("listFile-uploaded-content").innerHTML = url;
	        }
	      });
		});
	}
  var link = "";
  $(document).on("click", "#save:not(.disabled)", function(){
    function upload(blob){
      var formData = new FormData();
      formData.append('file', blob);
      $.ajax({
        url: "/hello?id=" + facebookId,
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(url) {
        	link = "https://media.cec.net.vn/i/" + url;
        document.getElementById("idShareMediaLink").value = link;
        document.getElementsByClassName("link-share").value = link;
        	console.log(url);
        	$(".loader").hide();
        	$(".share-option").show();
            $(".link-share").attr("href", link);
          $("#audio").attr("src", url);
          $("#audio")[0].play();
        }
      });
    }
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(upload, "blob");
    }else{
      Fr.voice.export(upload, "blob");
    }
    restore();
  });
  
	// Share button
  $(document).on("click", "#shareBtn", function(){
	  console.log("share facebook");
		window.open('http://facebook.com/sharer/sharer.php?u='+encodeURIComponent(link), '', 'left=0,top=0,width=650,height=420,personalbar=0,toolbar=0,scrollbars=0,resizable=0');
  });
});
