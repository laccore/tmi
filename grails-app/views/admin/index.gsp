<%@ page import="edu.umn.laccore.tmi.IdentificationType" %>
<%@ page import="java.util.*" %>
<html>
    <head>
        <title>TMI - Admin</title>
        <meta name="layout" content="umn" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;
        }
        #commonTasks {
        	margin-left:30px;
        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        </style>
    </head>
    <body>
    <sec:ifAllGranted roles="ROLE_ADMIN">
    	<g:if test="${flash.info}">
			<div class="message">
				${flash.info.join("<br/>")}
			</div>
		</g:if>
		<div class="nav">
            <span class="menuButton"><g:link action="reindexSearch">Reindex Search</g:link></span>
        	<span class="menuButton"><g:link action="startMirroring">Restart Search Mirroring</g:link></span>
        	<span class="menuButton"><g:link action="reindexTags">Reindex Tags</g:link></span>
        	<span class="menuButton"><g:link controller="tags" action="show">Tag List</g:link></span>
        	<span class="menuButton"><g:link controller="xapResource" action="refreshXap">Refresh Pivot Viewer</g:link></span>
        </div>
    
    	<h2>Links to Create/Edit/Delete Commonly-used TMI Objects</h2>
    	<div id="commonTasks"><ul>
    		<li><g:link class="link" controller="uniqueIdentification">Unique Identifications</g:link>, their
    		<g:link class="link" controller="identificationType">Identification Types</g:link> and 
    		<g:link class="link" controller="imposter">Imposters</g:link>
    		</li>
    		<li>A Unique Identification's <g:link class="link" controller="image">Images</g:link></li>
    		<li>Image traits: <g:link class="link" controller="lightType">Light Type</g:link> and <g:link class="link" controller="corerType">Corer Type</g:link></li>
			<li><g:link class="link" controller="artifact">Core Face Images</g:link> and their <g:link class="link" controller="artifact">Annotations</g:link> (found on the Core Face > Sediment Textures page)</li>
    		<li>Coring <g:link class="link" controller="artifact">Artifacts</g:link> and their <g:link class="link" controller="artifact">Categories</g:link> (found on the Core Face > Artifact Catalogue page)</li>
			<li><g:link class="link" controller="question">Questions</g:link> and <g:link class="link" controller="edge">Edges</g:link> used in the Quickstart page's Interactive Key.
				An Edge is a response/answer to a Question. The selected Edge leads to another Question, or terminates in a Unique Identifcation.</li>
			<li>Contents of the Tutorials page are managed in the <a class="link" href="http://tmitutorials.blogspot.com">TMI Tutorials page on Blogger.</a></li>
			<li>Frequently-Asked <g:link class="link" controller="faq">Questions and Answers</g:link> (found on Help > FAQ)</li>
		</ul></div>
    	
    	<br/><br/><hr style="border:1;"/>
	
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>     
            </div>
                <div class="panelBtm"></div>
            </div>
            <h2>Available Controllers:</h2>
            <ul>
           		<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
               		<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
               </g:each>
            </ul>
        </sec:ifAllGranted>
		<g:each in="${contentInstanceList}" var="c">
			
		</g:each>
		
		<g:render template="storedContent" collection="${contentInstanceList}" var="c"/>
    </body>
</html>
