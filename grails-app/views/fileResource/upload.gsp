<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="umn" />
<title>File Resource</title>
</head>
<body>
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
		<h1>Upload Images</h1>
		<g:form method="post" enctype="multipart/form-data">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><label for="fileUpload.1">Upload:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload.1" name="fileUpload.1" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"></td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload.2" name="fileUpload.2" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"></td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload.3" name="fileUpload.3" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"></td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload.4" name="fileUpload.4" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"></td>
							<td valign="top"
								class="value ${hasErrors(bean:fileResourceInstance,field:'upload','errors')}">
								<input type="file" id="fileUpload.5" name="fileUpload.5" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:actionSubmit class="upload"
						value="Upload" action="upload" />
				</span>
			</div>
		</g:form>
</body>
</html>