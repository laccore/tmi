<%@ page import="edu.umn.laccore.tmi.Artifact" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="umn">
		<g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
		<title>Artifact Catalogue</title>
		<style>
			.coreface {
				position:relative;
				overflow:auto;
				width:900px;
				border:1px solid black;
			}
			.coreface .overlay {
				position:absolute;
				top:0px;
				left:0px;
				opacity:0;
				overflow:auto;
			}
			.thumb {
				position:relative;
				width:900px;
			}
			.thumb .thumbOverlay {
				position:absolute;
				top:0px;
				left:0px;
				border:2px solid yellow;
			}
		</style>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// install handlers
				FUNCS.onShowAnnotation();
				FUNCS.onScrollCoreface();
			});
			
			// $(window).load is called after images are loaded
			$(window).load(function() {
				// now that images' dimensions are known, size and draw
				// thumbnail overlays by triggering scroll event.
				$(".coreface").scroll();
			});
			
			var FUNCS = {
				onShowAnnotation: function() {
					$(":checkbox").click( FUNCS.showHideAnnotation );
				},
				showHideAnnotation: function(event) {
					var overlayDiv = $(this).parent().find(".overlay").first();
					overlayDiv.css("opacity", this.checked ? "1" : "0");	
				},
				onScrollCoreface: function() {
					$(".coreface").on("scroll", FUNCS.updateThumbOverlay ); 
				},
				updateThumbOverlay: function(event) {
					var cfImgWidth = $(this).find("img").first()[0].naturalWidth;
					var thumbImg = $(this).parent().find(".thumbImage").first();
					var thumbOverlay = $(this).parent().find(".thumbOverlay").first();
					var scrollLeft = $(this).scrollLeft();
					var scale = cfImgWidth / 900.0;
					thumbOverlay.css({
						"left" : scrollLeft / scale - 2 + 'px', // -2 for border
						"width": thumbImg[0].width / scale + 'px',
						"height": thumbImg[0].height - 4 + 'px' // - 4 for border
					});
				},
				foo: function(corefaceDiv) {
					var cfImgWidth = corefaceDiv.find("img").first()[0].naturalWidth;
					var thumbImg = corefaceDiv.parent().find(".thumbImage").first();
					var thumbOverlay = corefaceDiv.parent().find(".thumbOverlay").first();
					var scrollLeft = corefaceDiv.scrollLeft();
					var scale = cfImgWidth / 900.0;
					thumbOverlay.css({
						"left" : scrollLeft / scale - 2 + 'px', // -2 for border
						"width": thumbImg[0].width / scale + 'px',
						"height": thumbImg[0].height - 4 + 'px' // - 4 for border
					});
				}
			};
		</script>		
	</head>
	<body>
		<g:each in="${typedArtifactMap}" var="type">
			<h1>${type.key} Artifacts</h1>
			<g:each in="${type.value}">
				<h2>${it.name}</h2>
				<p>${it.description}</p>
				<div>
					<input type="checkbox" />Show Annotations
					<div class="coreface">
						<img src="${createLinkTo(dir:'components/artifact/', file:it.artifactImage)}">
						<div class="overlay">
							<img src="${createLinkTo(dir:'components/artifact/', file:it.annotationImage)}">
						</div>
					</div>
					<br/>
					<div class="thumb">
						<img class="thumbImage" width=900 src="${createLinkTo(dir:'components/artifact/', file:it.artifactImage)}">
						<div class="thumbOverlay"></div>
					</div>
				</div>
				<br/><br/>
			</g:each>
		</g:each>
	</body>
</html>