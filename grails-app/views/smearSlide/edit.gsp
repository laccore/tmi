<%@ page import="edu.umn.laccore.tmi.SmearSlide" %>
<!doctype html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    	<meta name="layout" content="umn" />
  		<g:set var="entityName" value="${message(code: 'smearSlide.label', default: 'Smear Slide')}" />
  		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	    <div class="nav">
	      	<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
	      	<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
	    </div>
    	<div class="body">
      		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
      		<g:if test="${flash.message}">
        		<div class="message">${flash.message}</div>
      		</g:if>
      		<g:hasErrors bean="${smearSlideInstance}">
        		<div class="errors">
          			<g:renderErrors bean="${smearSlideInstance}" as="list" />
        		</div>
      		</g:hasErrors>

      		<g:form action="save" method="post">
      		    <!-- Render the smear slide template -->
        		<g:render template="smearSlide" model="['smearSlideInstance':smearSlideInstance]"/>
        		<div class="buttons">
        			<g:hiddenField name="id" value="${smearSlideInstance?.id}" />
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <!--  2/20/2014 brg: Hide sedclass preview button. Clicks are simulated whenever an edit field's onChange event fires, freeing
                    	user from manually clicking preview button to see updated sedclass. Couldn't find a way to update sedclass based on
                    	the onChange event, thus the click simulation.  g:submitToForm tag ignores style attributes, hide in enclosing span instead. -->
                    <span class="button" style="display:none;"><g:submitToRemote id="previewSedclassButton" value="Preview Sedclass" update="sedclasszone" url="[controller:'smearSlide', action:'sedclass']"/></span>
        		</div>
        	</g:form>
		</div>
		
		<!--  Render the smear slide component template as hidden, provides us a base to clone from -->
    	<g:render template='sscomp' model="['sscomp':null,'i':'_clone','hidden':true]"/>
		
	</body>
</html>
