<%@ page import="edu.umn.laccore.tmi.IdentificationType" %>
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>

<html>
    <head>
        <title>TMI - Smear Slides - Quickstart</title>
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
        .tagCloud li {
        	display: inline-block;
        }
        </style>
    </head>
    <body>
        <div id="pageBody">
            <h1>Interactive Key</h1>
            <p style="margin-left:3em; margin-top:1em;">
            	Don't know what you're looking at? Use the <g:link controller="node" action="show" id="1">interactive key</g:link> 
            	to get your identification started! (Minerals and mineraloids only.)
            </p>
            <h1>Search</h1>
            <p style="margin-left:3em; margin-top:1em;">
            	Think it's in here, but don't know where? Search for it!
				<g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get" style="margin-left:3.7em; margin-top:1em;">
        		<g:textField class="inset" name="q" value="${params.q}" size="50"/> <input type="submit" value="Search" />
        		<g:hiddenField name="max" value="25"/>
    			</g:form>
    		</p>
    		<h1>ImageSieve</h1>
            <p style="margin-left:3em; margin-top:1em;">
            	Filter by multiple tags! <a href="${createLink(controller:"is")}">Sort, zoom, slice and dice</a> the database.  (Machine intensive.)
            </p>
			<h1>Browse Images</h1>
            <p style="margin-left:3em; margin-top:1em;">
            	Gallery - images of <g:link controller="inorganic" action="gallery">inorganic components</g:link><br/>
            	Gallery - images of <g:link controller="organic" action="gallery">organic components</g:link><br/>
            	Gallery - images of <g:link controller="quickstart" action="contaminantGallery">contaminants</g:link>
            </p>
            <h1>Tags</h1>
			<p style="margin-left:3em; margin-top:1em;">
            	Can you describe it? Select a tag and dive in!
            </p>
			<p><tags:tagCloud controller="tags" action="find" tags="${taggableService.getTagCounts('uniqueIdentification').sort()}"/></p>
        </div>
    </body>
</html>
