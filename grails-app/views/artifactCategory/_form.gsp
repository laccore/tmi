<%@ page import="edu.umn.laccore.tmi.ArtifactCategory" %>

		<tr class="prop">
			<td valign="top" class="name">
				<label for="name">
					<g:message code="artifactCategory.name.label" default="Name" />
					<span class="required-indicator">*</span>
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactCategoryInstance, field: 'name', 'errors')}">
				<g:textField name="name" value="${artifactCategoryInstance?.name}" />
			</td>
		</tr>		

		<tr class="prop">
			<td valign="top" class="name">
				<label for="description">
					<g:message code="artifactCategory.description.label" default="Description" />
					
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactCategoryInstance, field: 'description', 'errors')}">
				<g:textField name="description" value="${artifactCategoryInstance?.description}" />
			</td>
		</tr>		

		<tr class="prop">
			<td valign="top" class="name">
				<label for="categoryTags">
					<g:message code="artifactCategory.categoryTags.label" default="Category Tags" />
					
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactCategoryInstance, field: 'categoryTags', 'errors')}">
				<g:textField name="categoryTags" value="${artifactCategoryInstance?.categoryTags}" />
			</td>
		</tr>	
		
		<tr class="prop">
		  	<td valign="top" class="name">
				<label for="categoryImage"><g:message code="artifactCategory.categoryImage.label" default="Category Icon" /></label>
            </td>
			<td valign="top" class="value ${hasErrors(bean: artifactCategoryInstance, field: 'categoryImage', 'errors')}">
                <input type="file" name="categoryImagePayload" id="categoryImagePayload"/><br/>
                <g:if test="${artifactCategoryInstance.categoryImage?.length() > 0}">
                	<img src="${createLinkTo(dir:'components/artifact/', file:artifactCategoryInstance.categoryImage)}">
                   	<span style="font-size:80%;"><i>Current: ${artifactCategoryInstance.categoryImage}</i></span>
                </g:if>
            </td>
        </tr>

		<tr class="prop">
			<td valign="top" class="displayOrder">
				<label for="displayOrder">
					<g:message code="artifactCategory.displayOrder.label" default="Display Order" />
					
				</label>
			</td>
			<td valign="top" class="value ${hasErrors(bean: artifactCategoryInstance, field: 'displayOrder', 'errors')}">
				<g:textField name="displayOrder" value="${artifactCategoryInstance?.displayOrder}" />
			</td>
		</tr>	
        