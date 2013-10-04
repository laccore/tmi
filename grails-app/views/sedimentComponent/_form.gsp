<%@ page import="edu.umn.laccore.tmi.SedimentComponent" %>
<div class="dialog">
<table><tbody>
	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="sedimentComponent.name.label" default="Name (noun)" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: sedimentComponentInstance, field: 'name', 'errors')}">
			<g:textField name="name" required="" value="${sedimentComponentInstance?.name}"/>
		</td>
	</tr>
	
	<tr class="prop">
		<td valign="top" class="name">
			<label for="modifier">
			<g:message code="sedimentComponent.modifier.label" default="Modifier (adjective)" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: sedimentComponentInstance, field: 'modifier', 'errors')}">
			<g:textField name="modifier" required="" value="${sedimentComponentInstance?.modifier}"/>
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="type">
			<g:message code="sedimentComponent.type.label" default="Type" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: sedimentComponentInstance, field: 'type', 'errors')}">
			<g:select name="type" from="${SedimentComponent.SedimentType.values()}" required="" optionKey="key" optionValue="value" value="${sedimentComponentInstance?.type?.key}"/>
		</td>
	</tr>
	
	<tr class="prop">
		<td valign="top" class="name">
			<label for="isStandardComponent">
			<g:message code="sedimentComponent.isStandardComponent.label" default="Is Standard Component" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: sedimentComponentInstance, field: 'isStandardComponent', 'errors')}">
			<g:checkBox name="isStandardComponent" value="${sedimentComponentInstance?.isStandardComponent}" />
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="speechToTextMappings">
			<g:message code="sedimentComponent.speechToTextMappings.label" default="Speech to Text Mappings" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: sedimentComponentInstance, field: 'speechToTextMappings', 'errors')}">
			<g:textField name="speechToTextMappings" value="${sedimentComponentInstance?.speechToTextMappings}" />
		</td>
	</tr>
</tbody></table>
</div>

