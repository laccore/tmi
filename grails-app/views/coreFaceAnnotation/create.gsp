

<%@ page import="edu.umn.laccore.tmi.CoreFaceAnnotation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${coreFaceAnnotationInstance}">
            <div class="errors">
                <g:renderErrors bean="${coreFaceAnnotationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="coreFaceAnnotation.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="50" value="${coreFaceAnnotationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="x"><g:message code="coreFaceAnnotation.x.label" default="X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'x', 'errors')}">
                                    <g:textField name="x" value="${fieldValue(bean: coreFaceAnnotationInstance, field: 'x')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="y"><g:message code="coreFaceAnnotation.y.label" default="Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'y', 'errors')}">
                                    <g:textField name="y" value="${fieldValue(bean: coreFaceAnnotationInstance, field: 'y')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="width"><g:message code="coreFaceAnnotation.width.label" default="Width" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'width', 'errors')}">
                                    <g:textField name="width" value="${fieldValue(bean: coreFaceAnnotationInstance, field: 'width')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="height"><g:message code="coreFaceAnnotation.height.label" default="Height" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'height', 'errors')}">
                                    <g:textField name="height" value="${fieldValue(bean: coreFaceAnnotationInstance, field: 'height')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="coreFace"><g:message code="coreFaceAnnotation.coreFace.label" default="Core Face" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'coreFace', 'errors')}">
                                    <g:select name="coreFace.id" from="${edu.umn.laccore.tmi.CoreFaceImage.list()}" optionKey="id" value="${coreFaceAnnotationInstance?.coreFace?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="image"><g:message code="coreFaceAnnotation.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: coreFaceAnnotationInstance, field: 'image', 'errors')}">
                                    <g:select name="image.id" from="${edu.umn.laccore.tmi.Image.list()}" optionKey="id" optionValue="${{it.id + ': ' + it.name + ' (' + it.uniqueIdentification.name + ')'}}" value="${coreFaceAnnotationInstance?.image?.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
