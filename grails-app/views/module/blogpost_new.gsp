<html>
    <head>
        <title>TMI - Tutorials</title>
        <meta name="layout" content="umn" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        </style>
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    </head>
    <body>
        <div id="testit">
		<a href="#" onclick="alert( $('#blogspot').contents().find('body').html() )">remove</a>
		</div>
        <div id="pageBody">
        	<div id="blogspot" style="margin: 0 auto; width:100%; height:1000px;">
        		<object type="text/html" data="${params.postURL}" style="width:100%; height:100%; margin:1%;"></object>
        	</div>
			<!--  <iframe id="framed" width="100%" height="1000px" src="${params.postURL}"></iframe>-->
        </div>
        <script>alert( $('#blogspot').contents().find('body').html() );</script>
    </body>
</html>
