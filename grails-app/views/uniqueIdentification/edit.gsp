

<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uniqueIdentificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniqueIdentificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${uniqueIdentificationInstance?.id}" />
                <g:hiddenField name="version" value="${uniqueIdentificationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="identificationType"><g:message code="uniqueIdentification.identificationType.label" default="Identification Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'identificationType', 'errors')}">
                                    <g:select name="identificationType.id" from="${edu.umn.laccore.tmi.IdentificationType.list()}" optionKey="id" value="${uniqueIdentificationInstance?.identificationType?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="uniqueIdentification.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${uniqueIdentificationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="distinguishingFeatures"><g:message code="uniqueIdentification.distinguishingFeatures.label" default="Distinguishing Features" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'distinguishingFeatures', 'errors')}">
                                    <g:textArea name="distinguishingFeatures" cols="40" rows="5" value="${uniqueIdentificationInstance?.distinguishingFeatures}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="uniqueIdentification.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${uniqueIdentificationInstance?.description}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uiTags"><g:message code="uniqueIdentification.uiTags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'uiTags', 'errors')}">
                                    <g:textField name="uiTags" size="40" value="${uniqueIdentificationInstance?.uiTags}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="externalResources"><g:message code="uniqueIdentification.externalResources.label" default="External Resources" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'externalResources', 'errors')}">
                                    
<ul>
<g:each in="${uniqueIdentificationInstance?.externalResources?}" var="e">
    <li><g:link controller="externalResource" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="externalResource" action="create" params="['uniqueIdentification.id': uniqueIdentificationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'externalResource.label', default: 'ExternalResource')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="images"><g:message code="uniqueIdentification.images.label" default="Images" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'images', 'errors')}">

			<!--  Table of UniqueIdentification's images -->
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th>${message(code: 'image.name.label', default: 'Name')}</th>
                        	<th>Thumbnail</th>
							<th>${message(code: 'image.displayOrder.label', default: 'Display Order')}</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${imageInstances}" status="i" var="imageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: imageInstance, field: "name")}</td>
                        	<td>
                        		<g:link action="show" id="${imageInstance.id}">
                        			<img src="${createLinkTo(dir:imageInstance.viewDir(), file:imageInstance.filenameThumb)}" 
									alt="${imageInstance.filename}" title="${imageInstance.filename}" style="max-height:100px; max-width:100px;" />
								</g:link>
							</td>
                            <td><g:textField name="displayOrder" size="3" value="${imageInstance?.displayOrder}" /></td>
                            <!-- <td>${fieldValue(bean: imageInstance, field: "displayOrder")}</td> -->
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

<g:link controller="image" action="create" params="['uniqueIdentification.id': uniqueIdentificationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'image.label', default: 'Image')])}</g:link>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imposters"><g:message code="uniqueIdentification.imposters.label" default="Imposters" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uniqueIdentificationInstance, field: 'imposters', 'errors')}">
                                    
<ul>
<g:each in="${uniqueIdentificationInstance?.imposters?}" var="i">
    <li><g:link controller="imposter" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="imposter" action="create" params="['uniqueIdentification.id': uniqueIdentificationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imposter.label', default: 'Imposter')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
