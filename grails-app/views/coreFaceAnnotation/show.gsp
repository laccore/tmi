
<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
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
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.x.label" default="X" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "x")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.y.label" default="Y" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "y")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.width.label" default="Width" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "width")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.height.label" default="Height" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: coreFaceAnnotationInstance, field: "height")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.coreFace.label" default="Core Face" /></td>
                            
                            <td valign="top" class="value"><g:link controller="coreFaceImage" action="show" id="${coreFaceAnnotationInstance?.coreFace?.id}">${coreFaceAnnotationInstance?.coreFace?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="coreFaceAnnotation.image.label" default="Image" /></td>
                            
                            <td valign="top" class="value"><g:link controller="image" action="show" id="${coreFaceAnnotationInstance?.image?.id}">${coreFaceAnnotationInstance?.image?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${coreFaceAnnotationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
