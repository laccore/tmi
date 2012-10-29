
<%@ page import="edu.umn.laccore.tmi.UniqueIdentification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')}" />
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
                            <td valign="top" class="name"><g:message code="uniqueIdentification.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: uniqueIdentificationInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.identificationType.label" default="Identification Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="identificationType" action="show" id="${uniqueIdentificationInstance?.identificationType?.id}">${uniqueIdentificationInstance?.identificationType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: uniqueIdentificationInstance, field: "name")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.distinguishingFeatures.label" default="Distinguishing Features" /></td>
                            
                            <td valign="top" class="value" style="color:#6dcf1d">${fieldValue(bean: uniqueIdentificationInstance, field: "distinguishingFeatures").replaceAll(/\n/, '<br />')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: uniqueIdentificationInstance, field: "description").replaceAll(/\n/, '<br />')}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.uiTags.label" default="Tags" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: uniqueIdentificationInstance, field: "uiTags").replaceAll(" ", '<br />')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.externalResources.label" default="External Resources" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                
                                <g:each in="${uniqueIdentificationInstance.externalResources}" var="e">
                                    <%--<li><g:link controller="externalResource" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>--%>
                                    <a href="${e.URL}" target="_blank">${e.name}</a>
                                </g:each>
                                
                            </td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.imposters.label" default="Imposters" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                
                                <g:each in="${uniqueIdentificationInstance.imposters}" var="i">
                                    <g:link controller="uniqueIdentification" action="show" id="${i.imposter.id}">${i?.encodeAsHTML()}</g:link>
                                    <br/>${i.description }<br/>
                                </g:each>
                                
                            </td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="uniqueIdentification.images.label" default="Images" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                               
                            </td>
                        </tr>
                        <g:each in="${uniqueIdentificationInstance.imagesInDisplayOrder()}" var="imageInstance">
                        	<tr>
                        		<td style="text-align:right"><%--
                        			Magnification: ${imageInstance.magnification}<br/>
                        			Submitted by: ${imageInstance.submittedBy }<br/>
                        			Lake name: ${imageInstance.lakeName }<br/>
                        			Notes: ${imageInstance.notes }<br/>
                        		--%></td>
                        		<td>
                        			<g:link controller="image" action="show" id="${imageInstance.id}">${i?.encodeAsHTML()}</g:link>
                                    <a href="${createLinkTo(dir:imageInstance.viewDir(), file:''+imageInstance.filename)}">
                        				<img src="${createLinkTo(dir:imageInstance.viewDir(), file:imageInstance.filenameMedium)}" 
                        					alt="${imageInstance.filenameMedium}"
title="
Light type: ${imageInstance.lightType?:'not specified'}
Magnification: ${imageInstance.magnification?:'not specified'}
Submitted by: ${imageInstance.submittedBy?:'not specified' }
Lake name: ${imageInstance.lakeName?:'not specified' }
Notes: ${imageInstance.notes?:'none' }"/>
                        							
                        			</a>
                        		</td>
                        	</tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${uniqueIdentificationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
