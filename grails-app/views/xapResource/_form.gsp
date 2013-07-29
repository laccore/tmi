<%@ page import="edu.umn.laccore.tmi.XapResource" %>



<div class="fieldcontain ${hasErrors(bean: xapResourceInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="xapResource.summary.label" default="Summary" />
		
	</label>
	<g:textField name="summary" value="${xapResourceInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: xapResourceInstance, field: 'packagingScript', 'error')} ">
	<label for="packagingScript">
		<g:message code="xapResource.packagingScript.label" default="Packaging Script" />
		
	</label>
	<input type="file" id="packagingScript" name="packagingScript" />
</div>

<div class="fieldcontain ${hasErrors(bean: xapResourceInstance, field: 'metadataSql', 'error')} ">
	<label for="metadataSql">
		<g:message code="xapResource.metadataSql.label" default="Metadata Sql" />
		
	</label>
	<g:textArea name="metadataSql" cols="40" rows="5" value="${xapResourceInstance?.metadataSql}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: xapResourceInstance, field: 'deploymentXap', 'error')} ">
	<label for="deploymentXap">
		<g:message code="xapResource.deploymentXap.label" default="Deployment Xap" />
		
	</label>
	<input type="file" id="deploymentXap" name="deploymentXap" />
</div>

