
<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="umn">
		<g:set var="entityName" value="${message(code: 'smearSlide.label', default: 'SmearSlide')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</div>
		<div class="body">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="dialog"><table><tbody>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.name.label" default="Name" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "name")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.sedclassName.label" default="Sedclass Name" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "sedclassName")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.grainSize.label" default="Grain Size" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "grainSize")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.components.label" default="Components" /></td>
            		<td valign="top" class="value">
            			<!-- switch a and b to sort descending -->
            			<g:each in="${smearSlideInstance.components.sort {a,b -> b.percentage.compareTo(a.percentage)}}" var="sscomp">
            				<span class="property-value" aria-labelledby="components-label">${sscomp.toString()}</br></span>
						</g:each>
						<br/>Total: ${smearSlideInstance.totalPercentage()}%
            		</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.coreSection.label" default="Core Section" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "coreSection")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.depth.label" default="Depth" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "depth")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.reason.label" default="Reason" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "reason")}</td>
            	</tr>
				<tr class="prop">
            		<td valign="top" class="name"><g:message code="smearSlide.comments.label" default="Comments" /></td>
            		<td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "comments")}</td>
            	</tr>
            </tbody></table></div>
			
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${smearSlideInstance?.id}" />
				    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				</g:form>
			</div>
		</div>
	</body>
</html>
