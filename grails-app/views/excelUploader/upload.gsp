<html>
<head>
<meta name="layout" content="umn" />
<title>TMI - Excel Image Metadata Uploader</title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home" href="/">Home</a></span>
		<span class="menuButton"><a class="excel" href="${resource(dir:'resources',file:'ImageUploadTemplate.xlsx')}" target="_blank">Metadata Template</a></span>
	</div>
	<div class="body">
		<h1>Image Metadata Uploader</h1>
		<p style="margin-left: 3em; margin-top: 1em;">Download the template, follow the example row for each component.  Then upload using the form below.</p>
		<g:if test="${flash.info}">
			<div class="message">
				${flash.info.join("<br/>")}
			</div>
		</g:if>
		<g:if test="${flash.warn}">
			<div class="warn">
				${flash.warn.join("<br/>")}
			</div>
		</g:if>
		<g:if test="${flash.error}">
			<div class="errors">
				${flash.error.join("<br/>")}
			</div>
		</g:if>
		<g:form method="post" enctype="multipart/form-data">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name">Upload:</td>
							<td valign="top"
								class="value ${hasErrors(bean:excelUploaderInstance,field:'file','errors')}">
								<input type="file" id="file" name="file" /></td>
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
	</div>
	<br />
</body>
</html>
