<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.expedition.label" default="Expedition" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'expedition', 'errors')}">
				<g:textField id="expedition" name="expedition" size="40" value="${smearSlideInstance?.expedition}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.lakeYear.label" default="Lake and Year" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'lakeYear', 'errors')}">
				<g:textField id="lakeYear" name="lakeYear" size="40" value="${smearSlideInstance?.lakeYear}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.siteHole.label" default="Site and Hole" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'siteHole', 'errors')}">
				<g:textField id="siteHole" name="siteHole" size="40" value="${smearSlideInstance?.siteHole}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.driveTool.label" default="Drive and Tool" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'driveTool', 'errors')}">
				<g:textField id="driveTool" name="driveTool" size="40" value="${smearSlideInstance?.driveTool}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.section.label" default="Section" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'section', 'errors')}">
				<g:textField id="section" name="section" size="40" value="${smearSlideInstance?.section}" />
			</td>
		</tr>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="depth">
					<g:message code="smearSlide.depth.label" default="Depth" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'depth', 'errors')}">
				<g:textField id="depth" name="depth" value="${fieldValue(bean: smearSlideInstance, field: 'depth')}" /> <span style="font-size:0.9em">cm</span>
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="smearSlide.name.label" default="Slide Name" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'name', 'errors')}">
				<g:textField id="slideName" name="name" size="40" value="${smearSlideInstance?.name}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="reason">
					<g:message code="smearSlide.reason.label" default="Reason" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'reason', 'errors')}" style="padding-bottom:2em;">
				<g:textField name="reason" size="40" value="${smearSlideInstance?.reason}" />
			</td>
		</tr>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="grainSize">
					<g:message code="smearSlide.grainSize.label" default="Grain Size" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'grainSize', 'errors')}">
				<g:textField name="grainSize" size="30" value="${smearSlideInstance?.grainSize}" onchange='onAbundanceChange()' /> <span style="font-size:0.9em">e.g., silty clay</span>
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
				<i>Suggested Sedclass</i>
			</td>
			<td>
			 	<i><b><span id="sedclassPreview" style="font-size:125%;"></span></b></i><br/><br/>	
				<button id="useSuggestedSedclass" type="button">Use Suggested Sedclass</button>
			</td>
		</tr>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="sedclassName">
					<g:message code="smearSlide.sedclassName.label" default="Sedclass Name" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'sedclassName', 'errors')}">
				<g:textField name="sedclassName" size="40" value="${smearSlideInstance?.sedclassName}" />
			</td>
		</tr>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="comments">
					<g:message code="smearSlide.comments.label" default="Comments" />
					
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'comments', 'errors')}">
				<g:textField name="comments" size="40" value="${smearSlideInstance?.comments}" />
			</td>
		</tr>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="user">
					<g:message code="smearSlide.user.label" default="User" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: smearSlideInstance, field: 'user', 'errors')}">
				${smearSlideInstance?.user?.username}
				<g:hiddenField name="user.id" value="${smearSlideInstance?.user?.id}"/>
			</td>
		</tr>
		<!--  2/20/2014 brg: Hide sedclass preview button. Clicks are simulated whenever an edit field's onChange event fires, freeing
        user from manually clicking preview button to see updated sedclass. Couldn't find a way to update sedclass based on
        the onChange event, thus the click simulation.  g:submitToForm tag ignores style attributes, hide in enclosing span instead. -->
        <span class="button" style="display:none;">
        	<g:submitToRemote id="previewSedclassButton" value="Preview Sedclass" update="sedclassPreview" url="[controller:'smearSlide', action:'sedclass']"/>
        </span>