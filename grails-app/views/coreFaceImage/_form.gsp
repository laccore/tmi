<%@ page import="edu.umn.laccore.tmi.CoreFaceImage" %>



<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="coreFaceImage.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${coreFaceImageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="coreFaceImage.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${coreFaceImageInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'coreFaceImage', 'error')} required">
	<label for="payload">
		<g:message code="coreFaceImage.coreFaceImage.label" default="Core Face Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="payload" name="payload"/>
	<g:if test="${coreFaceImageInstance.coreFaceImage?.length() > 0}">
		<span style="font-size:80%;"><i>Current: ${coreFaceImageInstance.coreFaceImage}</i></span>
	</g:if>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceImageInstance, field: 'annotations', 'error')} ">
	<label for="annotations">
		<g:message code="coreFaceImage.annotations.label" default="Annotations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${coreFaceImageInstance?.annotations?}" var="a">
    <li>
    	<g:link controller="coreFaceAnnotation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link> center (${a?.x}, ${a?.y}), ${a?.width}w x ${a?.height}h
    </li>
</g:each>
<li class="add">
<g:link controller="coreFaceAnnotation" action="create" params="['coreFaceImage.id': coreFaceImageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')])}</g:link>
</li>
</ul>

</div>

