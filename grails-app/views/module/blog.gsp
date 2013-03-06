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
			<g:each in="${postList}" var="post">
				<h1><g:link action="blogpost" params="[postURL:"${post.url}"]">${post.title}</g:link></h1>
			</g:each>
        </div>
    </body>
</html>
