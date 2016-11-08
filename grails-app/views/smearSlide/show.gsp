
<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
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
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.id.label" default="ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.name.label" default="Slide Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.expedition.label" default="Expedition" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "expedition")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.lakeYear.label" default="Lake Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "lakeYear")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.siteHole.label" default="Site Hole" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "siteHole")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.driveTool.label" default="Drive Tool" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "driveTool")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.section.label" default="Section" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "section")}</td>
                            
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
                            <td valign="top" class="name"><g:message code="smearSlide.components.label" default="Components" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${smearSlideInstance.components}" var="c">
                                    <li><g:link controller="smearSlideComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="smearSlide.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${smearSlideInstance?.user?.id}">${smearSlideInstance?.user?.encodeAsHTML()}</g:link></td>
                            
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
                            <td valign="top" class="name"><g:message code="smearSlide.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: smearSlideInstance, field: "comments")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
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
