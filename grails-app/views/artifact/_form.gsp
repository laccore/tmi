<%@ page import="edu.umn.laccore.tmi.Artifact" %>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="artifact.name.label" default="Name" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'name', 'errors')}">
				<g:textField name="name" value="${artifactInstance?.name}" />
			</td>
		</tr>
		
		<tr class="prop">
			<td valign="top" class="name">
				<label for="description">
					<g:message code="artifact.description.label" default="Description" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'description', 'errors')}">
				<g:textArea name="description" value="${artifactInstance?.description}" />
			</td>
		</tr>		

		<tr class="prop">
			<td valign="top" class="name">
				<label for="uiTags">
					<g:message code="artifact.uiTags.label" default="Tags" />
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'uiTags', 'errors')}">
				<g:textField name="uiTags" value="${artifactInstance?.uiTags}" /><br/>
				List of tags, separated by spaces. Multi-word tags should use hyphens, e.g. my-tag.
			</td>
		</tr>		

		<tr class="prop">
			<td valign="top" class="name">
				<label for="artifactImage">
					<g:message code="artifact.artifactImage.label" default="Artifact Image" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'artifactImage', 'errors')}">
                <input type="file" name="artifactImagePayload" id="artifactImagePayload"/><br/>
                <g:if test="${artifactInstance.artifactImage?.length() > 0}">
                   	Current Image: <a href="${createLinkTo(dir:'components/artifact/', file:artifactInstance.artifactImage)}" target="_blank">${artifactInstance.artifactImage}</a>
                </g:if>
			</td>
		</tr>		

		<tr class="prop">
			<td valign="top" class="name">
				<label for="annotationImage">
					<g:message code="artifact.annotationImage.label" default="Annotation Image" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactInstance, field: 'annotationImage', 'errors')}">
                <input type="file" name="annotationImagePayload" id="annotationImagePayload"/><br/>
                <g:if test="${artifactInstance.annotationImage?.length() > 0}">
					Current Image: <a href="${createLinkTo(dir:'components/artifact/', file:artifactInstance.annotationImage)}" target="_blank">${artifactInstance.annotationImage}</a>
                </g:if>
			</td>
		</tr>