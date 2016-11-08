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
            <!-- <p style="margin-left:3em; margin-top:1em;">
            	TMI is designed to help both the novice and expert identify lacustrine and marine sedimentary components using microscopy.
            	The tool emphasizes visual reference materials supported by written expert guidance on identification and interpretation.
			</p>
			<p style="margin-left:3em; margin-top:1em;">
				Our original focus was solely on smear slides of minerals and mineraloids as viewed in the polarizing light (petrographic) 
				microscope, but the tool has expanded to include biological components that may be encountered while analyzing smear slides, 
				as well as macroscopic components typically viewed under a dissecting microscope, and some SEM images.
			</p>
			<p style="margin-left:3em; margin-top:1em;">
				Smear slides are a simple and powerful tool for the characterization of unconsolidated sediment. Used as a part of visual 
				core description, they provide a tremendous amount of information about past depositional environments, geochemistry 
				and mineralogy, and flora and fauna.
			</p>
			<p style="margin-left:3em; margin-top:1em;">
				The launch of TMI 2.0 in April 2013 improves usability and introduces the first tutorials. TMI is an evolving resource and 
				would benefit from your feedback and contributions. Please email amyrbo_at_umn.edu.
			</p>-->
			
			<p style="margin-left:3em; margin-top:1em;">
				TMI is designed to help both the novice and expert identify lacustrine and marine sedimentary components using microscopy. 
				The tool emphasizes visual reference materials supported by written expert guidance on identification and interpretation.
			</p>
			
			<p style="margin-left:3em; margin-top:1em;">
				Smear slides are a simple and powerful tool for the characterization of unconsolidated sediment. 
				Used as a part of visual core description, they provide a 
				tremendous amount of information about past depositional environments, geochemistry and mineralogy, and flora and fauna.
			</p>
			
			<p style="margin-left:3em; margin-top:1em;">
				Our original focus was solely on smear slides of minerals and mineraloids as viewed in the polarizing light 
				(petrographic) microscope, but the tool has expanded to include many other things:  
				biological components that may be encountered while analyzing smear slides, macroscopic components typically 
				viewed under a dissecting microscope, 
				and macroscopic images of cores illustrating sedimentary features and coring/drilling artifacts.
			</p>
			
			<p style="margin-left:3em; margin-top:1em;">
				There’s also a <g:link controller="smearSlide" action="list">tool</g:link> to help you translate sedimentary percentages to standard (yet flexible) 
				names according to the suggested sediment classification of Schnurrenberger et al., 2003.  
			</p>
			
			<p style="margin-left:3em; margin-top:1em;">
				TMI is an evolving resource and would benefit from your feedback and contributions. Please email amyrbo_at_umn.edu.
			</p>
			
			<p style="margin-left:3em; margin-top:1em;">
				TMI is funded by NSF Geoinformatics (EAR-1226265), NSF Instrumentation and Facilities (EAR-1462297), 
				and a University of Minnesota Interdisciplinary Informatics Seed Grant.
			</p>
			
			
			
		</div>
		<div  id="pageBody">
			<p style="margin-left:3em; margin-top:1em;">
				<a href="${resource(dir:'resources',file:'TMI_flyer_2012_sm.pdf')}">TMI Flyer</a><br/>
				<a href="${resource(dir:'resources',file:'TMIposterweb.pdf')}">2011 GSA Poster</a>
			</p>
			<p style="margin-left:3em; margin-top:1em;">
			TMI is funded by NSF Geoinformatics (EAR-1226265) and a University of Minnesota Interdisciplinary Informatics Seed Grant.
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
