

<%@ page import="edu.umn.laccore.tmi.Edge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'edge.label', default: 'Edge')}" />
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
            <g:hasErrors bean="${edgeInstance}">
            <div class="errors">
                <g:renderErrors bean="${edgeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:uploadForm action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="edge.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edgeInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${edgeInstance?.description}" size="50"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sourceNode"><g:message code="edge.sourceNode.label" default="Source Node" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edgeInstance, field: 'sourceNode', 'errors')}">
                                    <g:select name="sourceNode.id" from="${edu.umn.laccore.tmi.Node.list()}" optionKey="id" value="${edgeInstance?.sourceNode?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="targetNode"><g:message code="edge.targetNode.label" default="Target Node" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edgeInstance, field: 'targetNode', 'errors')}">
                                    <g:select name="targetNode.id" from="${edu.umn.laccore.tmi.Node.list()}" optionKey="id" value="${edgeInstance?.targetNode?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
						    	<td valign="top" class="name">
						    		<label for="payload">Image</label>
						    	</td>
						    	<td valign="top">
									<input type="file" id="payload" name="payload" value="${params?.payload}"/>
								</td>
							</tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:uploadForm>
        </div>
    </body>
</html>
