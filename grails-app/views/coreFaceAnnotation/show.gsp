
<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-coreFaceAnnotation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-coreFaceAnnotation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list coreFaceAnnotation">
			
				<g:if test="${coreFaceAnnotationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="coreFaceAnnotation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${coreFaceAnnotationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.x}">
				<li class="fieldcontain">
					<span id="x-label" class="property-label"><g:message code="coreFaceAnnotation.x.label" default="X" /></span>
					
						<span class="property-value" aria-labelledby="x-label"><g:fieldValue bean="${coreFaceAnnotationInstance}" field="x"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.y}">
				<li class="fieldcontain">
					<span id="y-label" class="property-label"><g:message code="coreFaceAnnotation.y.label" default="Y" /></span>
					
						<span class="property-value" aria-labelledby="y-label"><g:fieldValue bean="${coreFaceAnnotationInstance}" field="y"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.width}">
				<li class="fieldcontain">
					<span id="width-label" class="property-label"><g:message code="coreFaceAnnotation.width.label" default="Width" /></span>
					
						<span class="property-value" aria-labelledby="width-label"><g:fieldValue bean="${coreFaceAnnotationInstance}" field="width"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="coreFaceAnnotation.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${coreFaceAnnotationInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.coreFace}">
				<li class="fieldcontain">
					<span id="coreFace-label" class="property-label"><g:message code="coreFaceAnnotation.coreFace.label" default="Core Face" /></span>
					
						<span class="property-value" aria-labelledby="coreFace-label"><g:link controller="coreFaceImage" action="show" id="${coreFaceAnnotationInstance?.coreFace?.id}">${coreFaceAnnotationInstance?.coreFace?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${coreFaceAnnotationInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="coreFaceAnnotation.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:link controller="image" action="show" id="${coreFaceAnnotationInstance?.image?.id}">${coreFaceAnnotationInstance?.image?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${coreFaceAnnotationInstance?.id}" />
					<g:link class="edit" action="edit" id="${coreFaceAnnotationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
