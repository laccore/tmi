<r:require module="jquery" />
<r:script>
var childCount = ${smearSlideInstance?.components.size()} + 0;

function addSmearSlideComponent()
{
    var clone = $("#sscomp_clone").clone()
    var htmlId = 'components['+childCount+'].';
    var ssCompInput = clone.find("select[name$=component\\.id]");

    clone.find("input[id$=id]")
           .attr('id',htmlId + 'id')
           .attr('name',htmlId + 'id');
    clone.find("input[id$=deleted]")
            .attr('id',htmlId + 'deleted')
            .attr('name',htmlId + 'deleted');
    clone.find("input[id$=new]")
            .attr('id',htmlId + 'new')
            .attr('name',htmlId + 'new')
            .attr('value', 'true');
    clone.find("input[name$=withComponent]")
    		.val(false)
    		.attr('id', htmlId + 'withComponent')
    		.attr('name', htmlId + 'withComponent')
    ssCompInput.attr('name',htmlId + 'component.id')
    clone.find("input[name$=percentage]")
    		.val(0)
            .attr('name',htmlId + 'percentage');
    var withCheckbox = clone.find("input[id='with']");
    withCheckbox.attr('name', '' + childCount);
    withCheckbox.click(function() {
				var $this = $(this);
				var idstr = $(this).attr('name')
				var hiddenVal = $("input[name$=\\[" + idstr + "\\]\\.withComponent]")
				hiddenVal.val(this.checked ? true : false);
			});

    clone.attr('id', 'sscomp'+childCount);
	makeComponentRow(clone);
    clone.show();
    ssCompInput.focus();
    childCount++;
}

function makeComponentRow(clone) {
    var c = clone.find("#comp");
    var q = clone.find("#qty");
    var w = clone.find("#with");
    var d = clone.find("#delbutton");

    var row = $('<tr/>')
    row.attr('class','sscomp-row')
    var cell = $('<td/>')
    
    var hidden = clone.find("input[type='hidden']")
    //console.log("hidden items = " + hidden.length)
    hidden.each( function() {
    	//console.log($(this).prop('outerHTML'))
    	//$("#childList").append($(this))
    	cell.append($(this));
    });
    
    cell.append(c.prop('outerHTML'))
    row.append(cell)
    
    row.append(makeCell(q))
    row.append(makeCell(w))
    row.append(makeCell(d))
    
    $("#componentTable tr:last").before(row)
    
    installCheckHandlers();
}

function makeCell(elt) { return "<td>" + elt.prop('outerHTML') + "</td>"; }

function installCheckHandlers()
{
	$("input[id='with']").each(function(index) {
		$(this).click(function() {
			var $this = $(this);
			var idstr = $(this).attr('name')
			console.log("install click handler for " + idstr)
			var hiddenVal = $("input[id$=\\[" + idstr + "\\]\\.withComponent]")
			console.log("hidden val = " + hiddenVal)
			hiddenVal.val(this.checked ? "true" : "false");
			onAbundanceChange();
		});
	});
}

// update total component % text and sedclass preview text 
function onAbundanceChange()
{
	var sum = 0;
	$("input[name$='percentage']").each(function() {
		var strPct = $(this).val();
		if (strPct != "")
			sum += parseInt(strPct);
	});
	
	$("#previewSedclassButton").trigger("click") // simulate click to update sedclass
	$("#totalPercentage").html(sum.toString() + "%")
}

$(document).ready(onAbundanceChange()); // call as soon as page is loaded to update % text
$(document).ready(installCheckHandlers());

//bind click event on delete buttons using jquery live
$('.del-sscomp').live('click', function() {
    //console.log("this = " + $(this).html())
    //console.log("prnt = " + $(this).parents().parents().html())
    var prnt = $(this).parents(".sscomp-row") //find the parent div
    var delInput = prnt.find("input[id$='deleted']"); //find the deleted hidden input
	
	// set value to zero so we don't need to check deleted status in onAbundanceChange()
	prnt.find("input[name$='percentage']").val(0)
	onAbundanceChange();
	
	//  mark as deleted and hide div (removing div prevents proper deletion)
	delInput.attr('value','true');
	prnt.hide();
});

// copy suggested sedclass into Sediment Name field
$("#useSuggestedSedclass").live('click', function() {
	var suggestedSedclass = $("#sedclassPreview").html()
	$("#sedclassName").val(suggestedSedclass)
});
</r:script>

<table id="componentTable">
<tr><th>Component</th><th>Qty (%)</th><th>Minor</th><th>Delete</th></tr>

<div id="childList">
	<g:if test="${smearSlideInstance.components.size() > 0}">
	    <g:each var="sscomp" in="${smearSlideInstance.components}" status="i">
       		<tr class="sscomp-row"><td>
		    <g:hiddenField name='components[${i}].id' value='${sscomp?.id}'/>
		    <g:hiddenField name='components[${i}].deleted' value='false'/>
		    <g:hiddenField name='components[${i}].new' value="${sscomp?.id == null?'true':'false'}"/>
		    <g:hiddenField name='components[${i}].withComponent' value='${sscomp?.withComponent}' />
		
		    <g:select id="comp" name='components[${i}].component.id' from="${edu.umn.laccore.tmi.SedimentComponent.descendingList()}" optionKey="id" value='${sscomp?.component?.id}' style='width:100%;' onchange='onAbundanceChange()' /></td>
			<td><g:textField id="qty" type='number' size='4' name='components[${i}].percentage' value='${sscomp?.percentage}' onchange='onAbundanceChange()' /></td>
			<td><input id="with" type="checkbox" name="${i}" value="${sscomp?.withComponent}" <g:if test="${sscomp?.withComponent}">checked</g:if> /></td>
			<td><span id="delbutton" class="del-sscomp">
				<img src="${resource(dir:'images/skin', file:'icon_delete.png')}" style="vertical-align:middle;"/>
		    </span>
			</td></tr>
	    </g:each>
    </g:if>
</div>

<tr><td><button type="button" onclick="addSmearSlideComponent();">Add Component</button><span style="float:right;">Total:</span></td>
<td><span id="totalPercentage">0%</span></td></tr>
</table>
