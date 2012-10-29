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
		<h1>Unlinked Images</h1>
		<div class="list">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="files" title="File" colspan="3" />
						<g:sortableColumn property="path" title="Path" />
						<g:sortableColumn property="link to" title="Link to Image" />
					</tr>
				</thead>
				<tbody>
					<g:each in="${fileResourceInstanceList}" status="i"
						var="fileResourceInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td>
								${fileResourceInstance.decodeURL()}
							</td>
							<td><a
								href="${createLinkTo( dir:'components/unlinked' , file: fileResourceInstance.decodeURL(), absolute:true )}"
								target="_new">view</a>
							</td>
							<td><g:link action="delete"
									id="${fileResourceInstance.replace('.','###')}"
									onclick="return confirm('Are you sure?');"> delete </g:link>
							</td>
							<td>
								components/unlinked/${fileResourceInstance.decodeURL()}
							</td>
							<td><g:form action="linkImage" controller="image">
									<g:hiddenField name="filename"
										value="${fileResourceInstance.decodeURL()}" />
									<g:select name="image.id" from="${imagelessImages}"
										optionKey="id" value="${name}" optionKey="id" />
									<span class="menuButton"><g:submitButton name="link"
											value="Link" class="addLink" />
									</span>
								</g:form></td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>