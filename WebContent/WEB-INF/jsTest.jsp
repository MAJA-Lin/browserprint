<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%-- These comments are to prevent excess whitespace in the output.
--%><%@page session="false"%><%--
--%><!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Browserprint</title>
	<meta name="robots" content="noindex" >
	<script type="text/javascript" src="scripts/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="scripts/swfobject.js"></script>
	<script type="text/javascript">
		var flashvars = {};
		var params = {};
		var attributes = {};
		attributes.id = "OSData";
		swfobject.embedSWF("flash/OSData.swf", "OSDataDiv", "0", "0", "9.0.0", false, flashvars, params, attributes);
	</script>
	<script type="text/javascript" src="scripts/PluginDetect.js"></script>
	<script type="text/javascript" src="scripts/fingerprint.js"></script>
	<script type="text/javascript">
		$(window).load(function(){
			var flash = $("#OSData")[0];
			
			//Platform
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'Platform',
	    		name: 'Platform',
	    		value: getPlatform()
			}).appendTo('#formdiv')
			
			//PlatformFlash
			{
				var val;
				try{
					if(typeof flash === 'undefined'){
						val = 'No Flash';
					}
					else{
						val = getPlatformFlash(flash);
					}
				}catch(e){
					val = 'Flash disabled';
				}
				$('<input>').attr({
			    	type: 'hidden',
			    	id: 'PlatformFlash',
			    	name: 'PlatformFlash',
			    	value: val
				}).appendTo('#formdiv');
			}
			
			//PluginDetails
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'PluginDetails',
	    		name: 'PluginDetails',
	    		value: getPluginDetails()
			}).appendTo('#formdiv');
			
			//TimeZone
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'TimeZone',
	    		name: 'TimeZone',
	    		value: getTimeZone()
			}).appendTo('#formdiv');
	
			//ScreenDetails
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'ScreenDetails',
	    		name: 'ScreenDetails',
	    		value: getScreenDetails()
			}).appendTo('#formdiv');
			
			//ScreenDetailsFlash
			{
				var val;
				try{
					if(typeof flash === 'undefined'){
						val = 'No Flash';
					}
					else{
						val = getScreenDetailsFlash(flash);
					}
				}catch(e){
					val = 'Flash disabled';
				}
				$('<input>').attr({
			   		type: 'hidden',
			   		id: 'ScreenDetailsFlash',
			   		name: 'ScreenDetailsFlash',
			   		value: val
				}).appendTo('#formdiv');
			}
			
			//LanguageFlash
			{
				var val;
				try{
					if(typeof flash === 'undefined'){
						val = 'No Flash';
					}
					else{
						val = getLanguageFlash(flash);
					}
				}catch(e){
					val = 'Flash disabled';
				}
				$('<input>').attr({
			   		type: 'hidden',
			   		id: 'LanguageFlash',
			    	name: 'LanguageFlash',
			   		value: val
				}).appendTo('#formdiv');
			}
			
			//Fonts
			{
				var val;
				try{
					if(typeof flash === 'undefined'){
						val = 'No Flash';
					}
					else{
						val = getFonts(flash);
					}
				}catch(e){
					val = 'Flash disabled';
				}
				$('<input>').attr({
			   		type: 'hidden',
			   		id: 'Fonts',
			   		name: 'Fonts',
			   		value: val
				}).appendTo('#formdiv');
			}
			
			//CharSizes
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'CharSizes',
	    		name: 'CharSizes',
	    		value: getCharacterSizes()
			}).appendTo('#formdiv');
			
			//SuperCookie
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'SuperCookie',
	    		name: 'SuperCookie',
	    		value: getSuperCookie()
			}).appendTo('#formdiv');
			
			//DateTime
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'DateTime',
	    		name: 'DateTime',
	    		value: getDateTime()
			}).appendTo('#formdiv');
			
			//MathTan
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'MathTan',
	    		name: 'MathTan',
	    		value: getMathTan()
			}).appendTo('#formdiv');
			
			//AdsBlocked
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'AdsBlocked',
	    		name: 'AdsBlocked',
	    		value: getAdsBlocked()
			}).appendTo('#formdiv');
			
			//Canvas
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'Canvas',
	    		name: 'Canvas',
	    		value: getCanvas()
			}).appendTo('#formdiv');
			
			//WebGLVendor
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'WebGLVendor',
	    		name: 'WebGLVendor',
	    		value: getWebGLVendor()
			}).appendTo('#formdiv');
			
			//WebGLVendor
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'WebGLRenderer',
	    		name: 'WebGLRenderer',
	    		value: getWebGLRenderer()
			}).appendTo('#formdiv');
			
			//Submit the page.
			submitDetailsForm();
		});
		
		function submitDetailsForm(){
			//Time, for clock skew test.
			//We put this here to avoid the timer altering the time by however many seconds.
			$('<input>').attr({
	    		type: 'hidden',
	    		id: 'Time',
	    		name: 'Time',
	    		value: getTime()
			}).appendTo('#formdiv');
			
			$('#detailsForm').submit();
		}
	</script>
</head>
<body>
	<p>
		Please wait...
	</p>
	<form id="detailsForm" action="test?js_enabled=true" method="POST">
		<div id="formdiv">
		</div>
	</form>
	<!-- Flash for detecting fonts and other things. -->
	<div id="OSDataDiv">
			<a href="http://www.adobe.com/go/getflashplayer">
				<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
			</a>
	</div>
	<!-- Part of the ad blocking test. -->
	<script type="text/javascript">
        google_ad_height = 90;
    </script> 
	<div id="ad" style="display:none;">
		<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
	</div>
</body>
</html>