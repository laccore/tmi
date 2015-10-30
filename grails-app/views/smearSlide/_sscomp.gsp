<div id="sscomp${i}" class="sscomp-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='components[${i}].id' value='${sscomp?.id}'/>
    <g:hiddenField name='components[${i}].deleted' value='false'/>
    <g:hiddenField name='components[${i}].new' value="${sscomp?.id == null?'true':'false'}"/>
    <g:hiddenField name='components[${i}].withComponent' value='${sscomp?.withComponent}' />

    <g:select id="comp" name='components[${i}].component.id' from="${edu.umn.laccore.tmi.SedimentComponent.descendingList()}" optionKey="id" value='${sscomp?.component?.id}' style="width:210px;" onchange='onAbundanceChange()' />
	<g:textField id="qty" type='number' size='4' name='components[${i}].percentage' value='${sscomp?.percentage}' onchange='onAbundanceChange()' />
	<input id="with" type="checkbox" name="${i}" value="${sscomp?.withComponent}" <g:if test="${sscomp?.withComponent}">checked</g:if> />
	<span id="delbutton" class="del-sscomp">
		<img src="${resource(dir:'images/skin', file:'icon_delete.png')}" style="vertical-align:middle;"/>
    </span>
</div>
 