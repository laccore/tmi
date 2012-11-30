<%@ page import="edu.umn.laccore.tmi.Node" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
                <title>TMI - Smear Slides - 
			<g:if test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.Question')}">
				Question: ${fieldValue(bean: nodeInstance, field: 'name')}
			</g:if>
			<g:elseif test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.UniqueIdentification')}">
				<g:if test="${nodeInstance?.identificationType}">${fieldValue(bean: nodeInstance, field: "identificationType")}: </g:if>
				${fieldValue(bean: nodeInstance, field: "name")}
			</g:elseif>
			<g:else>
				Multiple Options
			</g:else>
			
		</title>
    </head>
	<body>
	    <div style="height:1em;"></div>
		<div style="font-size:3em; line-height:1em; font-weight:700; color:#031040; font-variant:small-caps;" id="name">
			<g:if test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.Question')}">
				${fieldValue(bean: nodeInstance, field: 'name').encodeAsHTML()}
			</g:if>
			<g:elseif test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.UniqueIdentification')}">
				${fieldValue(bean: nodeInstance, field: 'name')}
			</g:elseif>
			<g:else>
				Further Identification Needed
			</g:else>
		</div>
		
		
		<div id="content">
		
			<!-- Question -->
			<g:if test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.Question')}">
				<table style="border:0px">
				<tr>
					<td>
						<ul style="list-style-type:none; margin-top:2em;">
							<g:each in="${nodeInstance?.edges.sort {it.id}}" var="e">
							<li style="font-size: 2em; line-height:1.2em;"><g:link controller="node" action="show" id="${fieldValue(bean: e, field: 'targetNode.id')}">${e?.description}</g:link></li>
							</g:each>
						</ul>
					</td>

					<g:if test="${nodeInstance?.exampleImage}">
						<td>
						<img align="left" src="${resource(dir:'images/examples', file:nodeInstance.exampleImage)}" alt="${nodeInstance?.exampleAltText}">
						</td>
					</g:if>
				</tr>
				</table>
				<div style="height:3em;"></div>
			</g:if>
			
			
			<!-- Multiple Values -->
			
			<g:if test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.MultipleValue')}">
				<ul style="list-style-type:none; margin-top:2em;">
					<g:each in="${nodeInstance?.edges.sort {it.id}}" var="e">
						<li style="font-size: 2em; line-height:1.2em;"><g:link controller="node" action="show" id="${fieldValue(bean: e, field: 'targetNode.id')}">${e?.targetNode?.name?.encodeAsHTML()}</g:link></li>
					</g:each>
				</ul>
				<div style="height:3em;"></div>
			</g:if>
			
			
			<!-- UniqueIdentification -->
			<g:if test="${nodeInstance?.class.name.equals('edu.umn.laccore.tmi.UniqueIdentification')}">


				<!-- Distinguishing Features -->
				<div id="distinguishingFeatures" style="margin:1em; font-size:2em; font-weight:700; color:#6dcf1d; line-height:1.2em;">
					${nodeInstance?.distinguishingFeatures?.replaceAll(/\n/, '<br />')}
				</div>
				
				
				
				<!-- Images -->
				<div id="images" style="margin:2em; width: 45em;">
					<g:each in="${nodeInstance?.images.sort {it.displayOrder}}" var="i">
						<g:if test="${i.filename}">
							<g:link controller="uniqueIdentification" action="show" id="${fieldValue(bean:i, field: 'uniqueIdentification.id')}">
								<img src="${createLinkTo(dir:i.viewDir(), file:i.filenameThumb)}" 
								alt="${i.filename}" title="${i.filename}" 
								style="margin:1em; max-height:125px; max-width:125px;"/>
							</g:link>
						</g:if>
					</g:each>
				</div>
				
				
				
				<!-- Description -->
				<div id="description" style="margin:3em; width:50em;">
					<g:if test="${!nodeInstance?.description?.isEmpty()}">
						<span style="margin-left:-1em; color:#031040; font-size:1.5em; font-weight:700;">Description</span><br /><br />
						${nodeInstance?.description?.replaceAll(/\n/, '<br />')}
					</g:if>
				</div>
				
				
				
				<!-- Imposters -->
				<div id="imposters" style="margin:3em;">
					<g:if test="${!nodeInstance?.imposters.isEmpty()}">
						<span style="margin-left:-1em; color:#031040; font-size:1.5em; font-weight:700;">Imposters</span>
						<ul style="margin-left:-4em; padding-top:1em">
						<g:each in="${nodeInstance?.imposters.sort {it.id}}" var="i">
							<g:link controller="node" action="show" id="${fieldValue(bean: i, field: 'imposter.id')}">${i?.description?.encodeAsHTML()}</g:link><br />
						</g:each>
						</ul>
					</g:if>
				</div>
				
				
				
				<!-- External Resources -->
				<div id="externalResources" style="margin:3em;">
					<g:if test="${!nodeInstance?.externalResources?.isEmpty()}">
						<span style="margin-left:-1em; color:#031040; font-size:1.5em; font-weight:700;">External Resources</span>
						<ul style="margin-left:-4em; padding-top:1em;">
							<g:if test="nodeInstance?.externalResources">
							<g:each in="${nodeInstance?.externalResources}" var="e">
								<a href="${fieldValue(bean:e, field:'URL')}">${fieldValue(bean:e, field:'name')}</a>
							</g:each>
							</g:if>
						</ul>
					</g:if>
				</div>
			</g:if>
		</div>
	</body>
</html>
