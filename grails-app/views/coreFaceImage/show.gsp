
<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coreFaceImage.label', default: 'CoreFaceImage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-coreFaceImage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-coreFaceImage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list coreFaceImage">
			
				<g:if test="${coreFaceImageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="coreFaceImage.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${coreFaceImageInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceImageInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="coreFaceImage.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${coreFaceImageInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceImageInstance?.coreFaceImage}">
				<li class="fieldcontain">
					<span id="coreFaceImage-label" class="property-label"><g:message code="coreFaceImage.coreFaceImage.label" default="Core Face Image" /></span>
					
						<span class="property-value" aria-labelledby="coreFaceImage-label"><g:fieldValue bean="${coreFaceImageInstance}" field="coreFaceImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceImageInstance?.annotations}">
				<li class="fieldcontain">
					<span id="annotations-label" class="property-label"><g:message code="coreFaceImage.annotations.label" default="Annotations" /></span>
					
						<g:each in="${coreFaceImageInstance.annotations}" var="a">
						<span class="property-value" aria-labelledby="annotations-label"><g:link controller="coreFaceAnnotation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${coreFaceImageInstance?.id}" />
					<g:link class="edit" action="edit" id="${coreFaceImageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
