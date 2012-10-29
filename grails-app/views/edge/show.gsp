
<%@ page import="edu.umn.laccore.tmi.Edge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'edge.label', default: 'Edge')}" />
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
                            <td valign="top" class="name"><g:message code="edge.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edgeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="edge.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edgeInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="edge.sourceNode.label" default="Source Node" /></td>
                            
                            <td valign="top" class="value"><g:link controller="node" action="show" id="${edgeInstance?.sourceNode?.id}">${edgeInstance?.sourceNode?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="edge.targetNode.label" default="Target Node" /></td>
                            
                            <td valign="top" class="value"><g:link controller="node" action="show" id="${edgeInstance?.targetNode?.id}">${edgeInstance?.targetNode?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        
                        <g:if test="${edgeInstance?.imageName}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="edge.imageName.label" default="Image" /></td>
                            
                            <td valign="top" class="value">
                            	${fieldValue(bean: edgeInstance, field: "imageName")}<br/>
                            	<!--<g:if test="${edgeInstance.imageName!=null && !edgeInstance.imageName.isEmpty()}">-->
                            		<img src="${createLinkTo(dir:'components/edges/', file:edgeInstance.imageName)}"/>
                            	<!--</g:if>-->
                            </td>
                        </tr>
                        </g:if>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${edgeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
