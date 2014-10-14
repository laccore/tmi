<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>
<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<%@ page import="edu.umn.laccore.tmi.Image" %>
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
		<title>Core Face Images</title>
		<style>
			.coreFacePopup {
				display: none;
				background-color: #05153e;
				color: #FFFFFF;
				width: 600px;
				position: relative;
				bottom: 200px;
				z-index: 1000; // otherwise popups draw behind next core face's core image
			}
			.coreFaceHeader {
				height: 14px;
				padding: 5px;
				font-size: larger;
			}
			.coreFaceHeader a { color: #FFFFFF; }
			.coreFaceDesc {
				display: block;
				padding: 5px;
			}
			.coreFaceAnnotation:hover .coreFacePopup {
				display: block;
			}
			.coreFaceAnnotation {
				position: absolute;
				border: 1px solid yellow;				
				visibility: none;
				opacity: 0;
				transition:visibility 0s linear .5s, opacity .5s linear;
 				-webkit-transition:visibility 0s linear .5s, opacity .5s linear;
 				-moz-transition:visibility 0s linear .5s, opacity .5s linear;
 				-o-transition:visibility 0s linear .5s, opacity .5s linear;
			}
			.coreFaceImage:hover .coreFaceAnnotation {
				visibility: visible;
				opacity: 1;
				transition:visibility 0s linear .5s, opacity .5s linear;
 				-webkit-transition:visibility 0s linear .5s, opacity .5s linear;
 				-moz-transition:visibility 0s linear .5s, opacity .5s linear;
 				-o-transition:visibility 0s linear .5s, opacity .5s linear;
			}
			
			.coreFaceImage {
				position: relative;
			}
			.coreFaceImage img {
				display:block; // remove padding at bottom of image so annotation coords are correct
			}
		</style>
	</head>
	<body>
		<g:each in="${coreFaceImageInstanceList}">
			<h2>${it.name}</h2>
			<p>${it.description}</p>
			
			<div class="coreFaceImage">
				<img src="${createLinkTo(dir:'components/coreface/', file:it.coreFaceImage)}">
				<g:each in="${it.annotations}" var="annot" status="count">
					<div class="coreFaceAnnotation" style="${annot.cssStyle()}">
						<div class="coreFacePopup" style="${annot.popupStyle()}">
							<div class="coreFaceHeader">
								<span style="float:left"><b>${annot.image.uniqueIdentification.name}</b></span>
								<span style="float:right;">
									<g:link controller="uniqueIdentification" action="show" id="${annot.image.uniqueIdentification.id}" params="[:]">Open Unique ID page</g:link>
								</span>
							</div>
							<img src="${createLinkTo(dir:annot.image.viewDir(), file:annot.image.filenameMedium)}" alt="[no image]" title="${annot.image.filename}"/>
							<span class="coreFaceDesc"><g:annotImageMetadata id="${annot.image.id}" /></span>
						</div>
					</div>
				</g:each>
			</div>
			<br/><br/>
		</g:each>
	</body>
</html>
