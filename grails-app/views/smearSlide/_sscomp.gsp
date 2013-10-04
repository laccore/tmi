<div id="sscomp${i}" class="sscomp-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='components[${i}].id' value='${sscomp?.id}'/>
    <g:hiddenField name='components[${i}].deleted' value='false'/>
    <g:hiddenField name='components[${i}].new' value="${sscomp?.id == null?'true':'false'}"/>

    <g:select name='components[${i}].component.id' from="${edu.umn.laccore.tmi.SedimentComponent.descendingList()}" optionKey="id" value='${sscomp?.component?.id}' />
	<g:textField name='components[${i}].percentage' value='${sscomp?.percentage}' />
    <span class="del-sscomp">
	<img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
</div>
