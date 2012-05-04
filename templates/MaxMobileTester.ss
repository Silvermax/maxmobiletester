<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>MaxMobileTester :: Checking link: $CurrentLink</title>
	<style>
		body { margin: 20px; font-family: sans-serif; overflow-x: scroll; }
		.wrapper { width: 4000px; border-bottom: 1px solid #666; padding: 1em 0; display: table}
		.frame { float: left; }
		.footer {padding: 1em}
		h2 { margin: 0 0 5px 0; }
		iframe { margin: 0 20px 20px 0; border: 1px solid #666; }
	</style>	
</head>
<body>
	<div class="wrapper">
		<h1>MaxMobileTester</h1>
		<div>
			<% if MobileView %>
				Mobile View: <a href="/MaxMobileTester/">Deactivate</a> <br /> 
				Pages: <% control Pages %><a href="/MaxMobileTester/showpage/{$ID}?mobileview">$MenuTitle</a> | <% end_control %>
			<% else %>
				<% if MobileViewAvailable %>Mobile View: <a href="/MaxMobileTester/?mobileview">Activate</a> <br /><% end_if %>
				Pages: <% control Pages %><a href="/MaxMobileTester/showpage/{$ID}">$MenuTitle</a> | <% end_control %>
			<% end_if %>
		</div>
	</div>
	<div class="wrapper">
		<div class="frame">
			<h2>320 &times; 480 <small>(mobile)</small></h2>
			<iframe src="$CurrentLink" sandbox="allow-same-origin allow-forms" seamless width="320" height="480"></iframe>
		</div>
		<div class="frame">
			<h2>480 &times; 640 <small>(small tablet)</small></h2>                   
			<iframe src="$CurrentLink" sandbox="allow-same-origin allow-forms" seamless width="480" height="640"></iframe>
		</div>                                                                                                                        
		<div class="frame">
			<h2>768 &times; 1024 <small>(tablet - portrait)</small></h2>                   
			<iframe src="$CurrentLink" sandbox="allow-same-origin allow-forms" seamless width="768" height="1024"></iframe>
		</div>
		<div class="frame">
			<h2>1024 &times; 768 <small>(tablet - landscape)</small></h2>
			<iframe src="$CurrentLink" sandbox="allow-same-origin allow-forms" seamless width="1024" height="768"></iframe>
		</div>
		<div class="frame">
			<h2>1200 &times; 800 <small>(desktop)</small></h2>
			<iframe src="$CurrentLink" sandbox="allow-same-origin allow-forms" seamless width="1200" height="800"></iframe>
		</div>
	</div>
	<div class="footer">
			<a href="http://www.silvermax.sk/"><img src="/maxmobiletester/images/silvermax.logo.w150.png" alr="Silvermax"></a> module created by Pali Ondras |  <a href="https://gist.github.com/1685127">based on design tester</a>
	</div>
</body>
</html>