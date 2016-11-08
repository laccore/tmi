<r:require module="jquery" />
<r:script>
var childCount = ${smearSlideInstance?.components.size()} + 0;

// clone base sscomp set of elements (see sscomp_clone in SmearSlide/create and /edit.gsp),
// set values to defaults, and add row to componentTable
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

// create and add table row using filled-out sscomp clone
function makeComponentRow(clone) {
    var row = $('<tr/>')
    row.attr('class','sscomp-row')
    var cell = $('<td/>')
    
    // add hidden state elements to first cell
    var hidden = clone.find("input[type='hidden']")
    hidden.each( function() {
    	cell.append($(this));
    });
    
    // add component element to first cell
    var component = clone.find("#comp");
    cell.append(component.prop('outerHTML'))
    row.append(cell)

	// fill remaining cells
    var quantity = clone.find("#qty");
    var withVal = clone.find("#with"); // 'with' is a protected word in JavaScript...should probably change to 'minor'
    var delbutt = clone.find("#delbutton");
    row.append(makeCell(quantity))
    row.append(makeCell(withVal))
    row.append(makeCell(delbutt))
    
    // add before last row of table (last row is special, contains "Add Component" and "Total")
    $("#componentTable tr:last").before(row)
    
    installCheckHandlers();
}

function makeCell(elt) { return "<td>" + elt.prop('outerHTML') + "</td>"; }

// install handler to update sedclass preview to reflect changes in "with" checkboxes
function installCheckHandlers()
{
	$("input[id='with']").each(function(index) {
		$(this).click(function() {
			var $this = $(this);
			var idstr = $(this).attr('name')
			var hiddenVal = $("input[id$=\\[" + idstr + "\\]\\.withComponent]")
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
			sum += parseFloat(strPct);
	});
	
	$("#previewSedclassButton").trigger("click") // simulate click to update sedclass
	
	var roundedTotal = Math.round(sum * 100) / 100
	$("#totalPercentage").html(roundedTotal.toString() + "%")
}


// logic to generate full slide name from components
var nameComponentIds = ["#expedition", "#lakeYear", "#siteHole", "#driveTool", "#section", "#depth"]
function installNameHandlers() // listen to each component
{
	for (var i = 0; i < nameComponentIds.length; i++) {
		$(nameComponentIds[i]).live('input', function() {
			updateSlideName(true);
		});
	}
}

function updateSlideName(overwrite) // update full name on any change to ID component
{
	// should we overwrite existing slide name?
	if (!overwrite && $("#slideName").val() != "")
		return
	
	var slidename = ""
	for (var i = 0; i < nameComponentIds.length; i++) {
		var str = $(nameComponentIds[i]).val()
		if (str.length > 0) {
			slidename += str
			if (i < nameComponentIds.length - 1) {
				slidename += (i < nameComponentIds.length - 2) ? '-' : ' ' // space after #section 
			} else if (i == nameComponentIds.length - 1) { // #depth
				slidename += ' cm'
			}
		}
	}
	$("#slideName").val(slidename)
}

$(document).ready(onAbundanceChange()); // call as soon as page is loaded to update % text
$(document).ready(installNameHandlers()); 	// listen to name field changes

// if existing slide is loaded for Edit and its name somehow differs from that generated
// from its components, don't overwrite with generated name...presumably the user changed
// the generated name for a reason
$(document).ready(updateSlideName(false));
$(document).ready(installCheckHandlers());


// bind delete click event
$('.del-sscomp').live('click', function() {
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

	<g:if test="${smearSlideInstance.components.size() > 0}">
	    <g:each var="sscomp" in="${smearSlideInstance.components}" status="i">
       		<tr class="sscomp-row">
			    <g:render template="sscomp" model="['i':i, 'sscomp':sscomp]" />
			</tr>
	    </g:each>
    </g:if>

	<tr>
		<td><button type="button" onclick="addSmearSlideComponent();">Add Component</button><span style="float:right;">Total:</span></td>
		<td><span id="totalPercentage">0%</span></td>
	</tr>
</table>
