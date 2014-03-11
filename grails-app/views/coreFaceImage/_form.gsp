<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>



<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="coreFaceImage.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" value="${coreFaceImageInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="coreFaceImage.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" value="${coreFaceImageInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'coreFaceImage', 'error')} required">
	<label for="coreFaceImage">
		<g:message code="coreFaceImage.coreFaceImage.label" default="Core Face Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="coreFaceImage" value="${coreFaceImageInstance?.coreFaceImage}" />
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'annotations', 'error')} ">
	<label for="annotations">
		<g:message code="coreFaceImage.annotations.label" default="Annotations" />
		
	</label>
	
<ul>
<g:each in="${coreFaceImageInstance?.annotations?}" var="a">
    <li><g:link controller="coreFaceAnnotation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="coreFaceAnnotation" action="create" params="['coreFaceImage.id': coreFaceImageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')])}</g:link>

</div>

