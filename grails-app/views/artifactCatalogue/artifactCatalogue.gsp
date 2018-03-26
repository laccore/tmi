<%@ page import="edu.umn.laccore.tmi.Artifact" %>
<%@ page import="edu.umn.laccore.tmi.ArtifactCategory" %>

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
			.categoryImage img {
				height: auto;
				width: auto;
				padding: 2px;
			}
			.categoryHighlight { background-color:orange; }
			.tag {
				display: block;
				float: left;
				font-weight: bold;
				border: 1px solid black;
				background-color: #EEEEEE;
				padding: 5px;
				margin: 2px;
				cursor: pointer;
			}
			.tag a { text-decoration: none; }
			.tag img {
				vertical-align: middle;
				padding-right: 5px;
			}
			.categoryName {
				display: inline-block;
				float: left;
				vertical-align: middle;
				padding: 5px;
				margin: 2px;
			}
			#categoryInfo {
				display: block;
				overflow: auto;
				background-color: LightGray;
			}
			#categoryTags {
				display: block;
				overflow: auto;
				background-color: LightGray;
			}
			#selectedTags {
				display: block;
				overflow: auto;
				background-color: LightGreen;
			}
		</style>
		
		<!-- TODO more up-to-date version? -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script>
			var FilterTags = []
		
			$(document).ready(function() {
				// install handlers
				FUNCS.onShowAnnotation();
				FUNCS.onScrollCoreface();
				FUNCS.onCategoryHover();
				FUNCS.onClickThumbnail();
				FUNCS.selectFirstCategory();
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
				onClickThumbnail: function() {
					$(".thumb").on("click", FUNCS.updateVisibleRegion);
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
				onCategoryHover: function() {
					$(".categoryImage").on("mouseenter", FUNCS.updateCategory);
				},
				onSelectTag: function() {
					$("#categoryTags .tag").on("click", FUNCS.addFilterTag)
				},
				addFilterTag: function() {
					var tagname = $(this).text()
					if (FilterTags.indexOf(tagname) == -1) {
						$("#selectedTags").append(FUNCS.makeFilterTag(tagname))
						FilterTags.push(tagname)
						FUNCS.filterArtifacts()
					}
				},
				updateCategory: function() {
					var catImage = $(this).find("img")
					$(".categoryImage").find("img").removeClass("categoryHighlight") // clear highlighted category
					catImage.addClass("categoryHighlight") // highight current category

					// update name and desc
					var name = catImage.attr("title")
					var desc = catImage.attr("desc")
					var catInfoSpan = $("<span />", {'class':'categoryName', 'html':"<b>" + name + ":</b> "+ desc})
					$("#categoryInfo").html(catInfoSpan)

					// update tag list
					var tagTextSpan = $("<span />", {'class':'categoryName', 'html':'<b>Tags:</b>'})
					$("#categoryTags").html(tagTextSpan)
					var tagList = catImage.attr("tags").split(" ");
					for (var i = 0; i < tagList.length; i++) {
						$("#categoryTags").append(FUNCS.makeCategoryTag(tagList[i]))
					}
					FUNCS.onSelectTag()
				},
				makeTag: function(tagname, withx=false) {
					span = $("<span />", {'class':'tag'})
					if (withx) {
						ximg = $("<img />", {'src':'${resource(dir:"images",file:"circlex.png")}'})
						ximg.on('click', function() {
							$(this).parent().remove()
							tagidx = FilterTags.indexOf(tagname)
							FilterTags.splice(tagidx, 1)
							FUNCS.filterArtifacts()
						})
						span.append(ximg)
					}
					tag = $("<a />", {'html': tagname})
					span.append(tag)
					return span
				},
				filterArtifacts: function() {
					// show/hide artifacts based on FilterTags
					$(".artifact").each(function() {
						if (FilterTags.length == 0) { 
							$(this).show()
						} else {
							var artifactTags = $(this).attr("tags").split(" ")
							for (var i = 0; i < FilterTags.length; i++) {
								if (artifactTags.indexOf(FilterTags[i]) != -1) {
									$(this).show()
									break
								}
								$(this).hide()
							}
						}
					})
				},
				makeCategoryTag: function(tag) { return FUNCS.makeTag(tag) },
				makeFilterTag: function(tag) { return FUNCS.makeTag(tag, true) },
				removeFilterTag: function() { $(this).remove() },
				selectFirstCategory: function() { $(".categoryImage").first().mouseenter() },
				updateVisibleRegion: function(event) {
					var thumbImgWid = $(this).find("img").first()[0].width;
					var thumbOverlayDiv = $(this).find(".thumbOverlay").first()
					var thumbOverlayWid = thumbOverlayDiv.scrollWidth;
					var corefaceImg = $(this).parent().find("img").first()[0]
					var corefaceImgWid = corefaceImg.naturalWidth;
					
					var clickX = event.offsetX
					if (event.target == thumbOverlayDiv[0]) {
						// overlay rectangle was clicked, event.offsetX is relative to its left edge:
						// add the distance from overlay left edge to thumbnail's left edge.
						clickX += parseInt(thumbOverlayDiv.css("left"))
					}
					
					// scale overlay click position to full image position (assumes 900px width)
					var cfNewCenterX = clickX * (corefaceImgWid / thumbImgWid) - 450
					
					// scroll full image to match overlay click pos
					var cfdiv = $(this).parent().find(".coreface").first()[0]
					cfdiv.scrollLeft = cfNewCenterX
				}				
			};
		</script>		
	</head>
	<body>
		<g:each in="${artifactCategoryList}">
			<span class="categoryImage">
				<img src="${createLinkTo(dir:'components/artifact/', file:it.categoryImage)}" title="${it.name}" desc="${it.description}" tags="${it.categoryTags}">
			</span>
		</g:each>

		<!--  name and description of current category -->
		<div id="categoryInfo"></div>
		
		<!--  category tags div: show tags for last-hovered category -->
		<div id="categoryTags"></div>
		
		<!--  selected tags div: show currently selected tags -->
		<div id="selectedTags">
			<span class="categoryName"><b>Filter by Tag(s):</b></span>
		</div>
		<br/>
		
		<g:each in="${artifactList}">
			<div class="artifact" tags="${it.uiTags}">
				<h2>${it.name}</h2>
				<p>${it.description}</p>
				<p>Tags: ${it.uiTags}</p>
				<div>
					<input type="checkbox" /><b>&nbsp;Show Annotations</b>
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
				<br/><br/><br/><br/><hr/>
			</div>
		</g:each>
	</body>
</html>