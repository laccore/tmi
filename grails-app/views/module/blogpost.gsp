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
    </head>
    <body>
        <div id="pageBody">
			<div id="content"></div>
		    <script>
		      function handleResponse(response) {
		        document.getElementById("content").innerHTML += "<h1>" + response.title + "</h1>" + response.content;
		      }
		    </script>
		    <script src="${params.postURL}?callback=handleResponse&key=AIzaSyAXz1Gqzse2gLB63Y7JHP6ISkdiJN_lRTo"></script>
		    <!-- <iframe width="100%" height="1000px" src="${params.postURL}"></iframe> -->
        </div>
    </body>
</html>
