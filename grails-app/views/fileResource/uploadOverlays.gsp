<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="umn" />
<title>File Resource</title>
</head>
<body>
	<g:javascript src="utils.js" />
	<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="images" controller="fileResource" action="upload">Upload Images</g:link></span>
        	<span class="menuButton"><g:link class="link" controller="fileResource" action="list">Link Images</g:link></span>
        	<span class="menuButton"><g:link class="meta" controller="excelUploader" action="index">Upload Metadata</g:link></span>
        </div>
    <g:if test="${flash.info}">
		<div class="message">
			${flash.info.join("<br/>")}
		</div>
	</g:if>
	<g:if test="${flash.warning}">
		<div class="errors">
			${flash.warning.join("<br/>")}
		</div>
	</g:if>
	<div class="body">
		<h1>Upload Overlay Images</h1>
		A source image should be uploaded and linked to metadata before uploading its overlay. Overlays should be PNG files<br/>
		600 pixels wide. In order to add an overlay to the correct image record in the database,<br/>
		its filename must match that of the full-size image, except for the extension, which must be .png instead of .jpg,.<br/>
		e.g. the overlay for an image called superHuge-Plant.jpg should be called superHuge-Plant.png.<br/><br/>

		Multiple image files can be uploaded in a single Upload control using multiple selection.<br/>
		Windows: Shift- or Control-click. Mac: Shift- or &#8984;-click.<br/><br/>
		<g:form method="post" enctype="multipart/form-data">
			<div class="dialog">
				<table>
					<tbody id="uploadTableBody">
						<tr class="prop">
							<td valign="top" class="name"><label for="fileUpload">Upload:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload" name="fileUpload" onChange="addUploadField();" multiple/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:actionSubmit class="upload"
						value="Upload Overlays" action="uploadOverlays" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>