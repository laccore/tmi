<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>



<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="coreFaceAnnotation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${coreFaceAnnotationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'x', 'error')} required">
	<label for="x">
		<g:message code="coreFaceAnnotation.x.label" default="X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="x" type="number" value="${coreFaceAnnotationInstance.x}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'y', 'error')} required">
	<label for="y">
		<g:message code="coreFaceAnnotation.y.label" default="Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="y" type="number" value="${coreFaceAnnotationInstance.y}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'width', 'error')} required">
	<label for="width">
		<g:message code="coreFaceAnnotation.width.label" default="Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="width" type="number" value="${coreFaceAnnotationInstance.width}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="coreFaceAnnotation.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" type="number" value="${coreFaceAnnotationInstance.height}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'coreFace', 'error')} required">
	<label for="coreFace">
		<g:message code="coreFaceAnnotation.coreFace.label" default="Core Face" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="coreFace" name="coreFace.id" from="${edu.umn.laccore.tmi.CoreFaceImage.list()}" optionKey="id" required="" value="${coreFaceAnnotationInstance?.coreFace?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coreFaceAnnotationInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="coreFaceAnnotation.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="image" name="image.id" from="${edu.umn.laccore.tmi.Image.list()}" optionKey="id" optionValue="${{it.toDetailedString()}}" required="" value="${coreFaceAnnotationInstance?.image?.id}" class="many-to-one"/>
</div>

