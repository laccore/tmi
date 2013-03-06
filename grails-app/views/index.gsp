<%@ page import="edu.umn.laccore.tmi.Image" %>
<html>
    <head>
        <title>TMI - Smear Slides - Home</title>
        <meta name="layout" content="umn" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
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
            <h1 style="font-size:3em; color:#031040">Tool for Microscopic Identification</h1>
            <br/>
            <p style="margin-left:3em; margin-top:1em;">
            	Smear slides are a simple and powerful tool for the characterization of unconsolidated sediment. Used as a part of visual core descripton, they provide a tremendous amount of information about past depositional environments, geochemistry and mineralogy, and flora and fauna.
			</p>
			<p style="margin-left:3em; margin-top:1em;">
				TMI is designed to help the novice or expert identify lacustrine and marine sedimentary components as viewed in the polarizing light (petrographic) microscope, with reflected light as necessary. Our focus was originally solely on minerals and mineraloids, but the tool is expanding to cover some biological components that may be encountered while analyzing smear slides, as well as "macro" components typically viewed under a dissecting microscope.
			</p>
		</div>
		<div  id="pageBody">
			<p style="margin-left:3em; margin-top:1em;">
				<a href="${resource(dir:'resources',file:'TMIposterweb.pdf')}">2011 GSA Poster</a> and associated <a href="${resource(dir:'resources',file:'tmi_flyer_sm.pdf')}">flyer</a>
			</p>
		</div>
            
        <div id="pageBody">
            <h2 style="font-weight:700; color:#031040;">Random Components</h2>
			<p style="margin-left:1.5em; margin-top:1em;">
			<table style="border:0px">
			<tbody>
			<tr>
			<g:each in="${Image.chooseSome(12)}" var="imageInstance" status="count">
				<td style="text-align:center">
					<g:link controller="uniqueIdentification" action="show" id="${imageInstance.uniqueIdentification.id}">
					<img style="max-height:125px; max-width:125px;"
					src="${createLinkTo(dir:imageInstance.viewDir(), file:imageInstance.filenameThumb)}"
					alt="${imageInstance.filenameThumb}"
					title="${imageInstance.uniqueIdentification?.name}" />
				    </g:link>
				</td>
			    
			    <g:if test="${count == 5}">
			    	</tr><tr>
			    </g:if>
			</g:each>
			</tr></tbody></table>
			</p>
        </div>
    </body>
</html>
