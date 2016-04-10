<%@ page import="edu.umn.laccore.tmi.Artifact" %>


<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="artifact.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${artifactInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="artifact.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" value="${artifactInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'artifactType', 'error')} required">
	<label for="description">
		<g:message code="artifact.artifactType.label" default="Artifact Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="artifactType" value="${artifactInstance?.artifactType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'artifactImage', 'error')} required">
	<label for="artifactImage">
		<g:message code="artifact.artifactImage.label" default="Artifact Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="artifactImage" value="${artifactInstance?.artifactImage}" />
</div>

<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'annotationImage', 'error')} required">
	<label for="annotationImage">
		<g:message code="artifact.annotationImage.label" default="Annotation Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="annotationImage" value="${artifactInstance?.annotationImage}" />
</div>

