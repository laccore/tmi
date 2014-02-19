<html>
  <head>
	  <meta name="layout" content="umn" />
	  <title>TMI - Smear Slides - Help</title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;
	  			overflow:auto;
	  			height: 300px;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>

  <body>
  	<div id="pageBody">
		<h1>
			<g:each in="${tags}" status="i" var="tag">
				${tag}<br/>
			</g:each>
		</h1>
	</div>
  </body>
</html>
