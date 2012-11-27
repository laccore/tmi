

<%@ page import="edu.umn.laccore.tmi.Image" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
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
            <g:hasErrors bean="${imageInstance}">
            <div class="errors">
                <g:renderErrors bean="${imageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${imageInstance?.id}" />
                <g:hiddenField name="version" value="${imageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="image.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${imageInstance?.name}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="displayOrder">Display Order</label>
                                </td>
                                <td valign="top" class="value ">
                                    <input type="text" name="displayOrder" value="${imageInstance?.displayOrder}" id="displayOrder" />
                                </td>
                            </tr>

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="uniqueIdentification"><g:message code="image.uniqueIdentification.label" default="Unique Identification" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'uniqueIdentification', 'errors')}">
                                    <g:select name="uniqueIdentification.id" from="${edu.umn.laccore.tmi.UniqueIdentification.list()}" optionKey="id" value="${imageInstance?.uniqueIdentification?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lightType"><g:message code="image.lightType.label" default="Light Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'lightType', 'errors')}">
                                    <g:select name="lightType.id" from="${edu.umn.laccore.tmi.LightType.list()}" optionKey="id" value="${imageInstance?.lightType?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expeditionCode"><g:message code="image.expeditionCode.label" default="Expedition Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'expeditionCode', 'errors')}">
                                    <g:textField name="expeditionCode" value="${imageInstance?.expeditionCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lakeCode"><g:message code="image.lakeCode.label" default="Lake Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'lakeCode', 'errors')}">
                                    <g:textField name="lakeCode" value="${imageInstance?.lakeCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="image.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" maxlength="4" value="${imageInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="siteHole"><g:message code="image.siteHole.label" default="Site Hole" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'siteHole', 'errors')}">
                                    <g:textField name="siteHole" value="${imageInstance?.siteHole}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="drive"><g:message code="image.drive.label" default="Drive" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'drive', 'errors')}">
                                    <g:textField name="drive" value="${imageInstance?.drive}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="corerType"><g:message code="image.corerType.label" default="Corer Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'corerType', 'errors')}">
                                    <g:select name="corerType.id" from="${edu.umn.laccore.tmi.CorerType.list()}" optionKey="id" value="${imageInstance?.corerType?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="section"><g:message code="image.section.label" default="Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'section', 'errors')}">
                                    <g:textField name="section" value="${imageInstance?.section}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="depth"><g:message code="image.depth.label" default="Depth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'depth', 'errors')}">
                                    <g:textField name="depth" value="${imageInstance?.depth}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notes"><g:message code="image.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'notes', 'errors')}">
                                    <g:textArea name="notes" cols="50" rows="5" value="${imageInstance?.notes}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="submittedBy"><g:message code="image.submittedBy.label" default="Submitted By" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'submittedBy', 'errors')}">
                                    <g:textField name="submittedBy" value="${imageInstance?.submittedBy}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uiTags"><g:message code="image.uiTags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'uiTags', 'errors')}">
                                    <g:textField name="uiTags" size="50" value="${imageInstance?.uiTags}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="taxon"><g:message code="image.taxon.label" default="Taxon" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: imageInstance, field: 'taxon', 'errors')}">
                                    <g:textField name="taxon" size="50" value="${imageInstance?.taxon}" />
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