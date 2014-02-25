<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>

<div class="dialog">
<table><tbody>
	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.name.label" default="Name" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'name', 'errors')}">
			<g:textField name="name" required="" value="${smearSlideInstance?.name}"/>
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.coreSection.label" default="Core Section" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'coreSection', 'errors')}">
			<g:textField name="coreSection" value="${smearSlideInstance?.coreSection}"/>
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.depth.label" default="Depth" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'depth', 'errors')}">
			<g:textField name="depth" value="${smearSlideInstance?.depth}"/>
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.reason.label" default="Reason" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'reason', 'errors')}">
			<g:textField name="reason" value="${smearSlideInstance?.reason}"/>
		</td>
	</tr>
	
	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.comments.label" default="Comments" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'comments', 'errors')}">
			<g:textField name="comments" value="${smearSlideInstance?.comments}"/>
		</td>
	</tr>

	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.grainSize.label" default="Grain Size" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'grainSize', 'errors')}">
			<g:textField name="grainSize" required="" value="${smearSlideInstance?.grainSize}"/>
		</td>
	</tr>
	
	<tr class="prop">
		<td valign="top" class="name">
			<label for="components">
			<g:message code="smearSlide.components.label" default="Components" />
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'components', 'errors')}">
			<!-- smear slide component one-to-many renderer -->
			<g:render template='sscomps' model="['smearSlideInstance':smearSlideInstance]" />
		</td>
	</tr>

	<tr class="prop">
		<td>
			<i>Suggested sedclass</i>
		</td>
		<td>
		 	<i><span id="sedclasszone"></span></i><br/>
			<button id="useSuggestedSedclass" type="button">Use Suggested Sedclass</button>
		</td>
	</tr>
	
	<tr class="prop">
		<td valign="top" class="name">
			<label for="name">
			<g:message code="smearSlide.sedclassName.label" default="Sedclass Name" />
			<span class="required-indicator">*</span>
			</label>
		</td>
		<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'sedclassName', 'errors')}">
			<g:textField id="sedclassName" name="sedclassName" required="" value="${smearSlideInstance?.sedclassName}" size="40"/>
		</td>
	</tr>
</tbody></table>
</div> <!-- dialog -->

