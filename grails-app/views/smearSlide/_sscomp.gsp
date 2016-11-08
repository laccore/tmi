<%-- brg 10/29/2015:
Template for a single SmearSlideComponent. Since these are typically inserted into tables, <td> tags
are included. The only exception is the hidden sscomp_clone element, from which new rows are created. In
this case, <g:render> conveniently removes the orphaned <td> tags (sscomp_clone lives in a <div>, not a <table>).

Parameters:
sscomp: the SmearSlideComponent to render
i: component/row number
--%>

<td>
	<g:hiddenField name='components[${i}].id' value='${sscomp?.id}'/>
	<g:hiddenField name='components[${i}].deleted' value='false'/>
	<g:hiddenField name='components[${i}].new' value="${sscomp?.id == null?'true':'false'}"/>
	<g:hiddenField name='components[${i}].withComponent' value='${sscomp?.withComponent}' />
	<g:select id="comp" name='components[${i}].component.id' from="${edu.umn.laccore.tmi.SedimentComponent.descendingList()}" optionKey="id" value='${sscomp?.component?.id}' style="width:210px;" onchange='onAbundanceChange()' />
</td>
<td>
	<g:textField id="qty" type='number' size='4' name='components[${i}].percentage' value='${sscomp?.percentage}' onchange='onAbundanceChange()' required='true'/>
</td>
<td>
	<input id="with" type="checkbox" name="${i}" value="${sscomp?.withComponent}" <g:if test="${sscomp?.withComponent}">checked</g:if> />
</td>
<td>
	<span id="delbutton" class="del-sscomp">
		<img src="${resource(dir:'images/skin', file:'icon_delete.png')}" style="vertical-align:middle;"/>
	</span>
</td>
 