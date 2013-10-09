<r:require module="jquery" />
<r:script>
var childCount = ${smearSlideInstance?.components.size()} + 0;

function addSmearSlideComponent()
{
    var clone = $("#sscomp_clone").clone()
    var htmlId = 'components['+childCount+'].';
    var ssCompInput = clone.find("select[id$=component\\.id]");

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
    ssCompInput.attr('id',htmlId + 'component.id')
            .attr('name',htmlId + 'component.id');
    clone.find("input[id$=percentage]")
    		.val(0)
            .attr('id',htmlId + 'percentage')
            .attr('name',htmlId + 'percentage');

    clone.attr('id', 'sscomp'+childCount);
    $("#childList").append(clone);
    clone.show();
    ssCompInput.focus();
    childCount++;
}

//bind click event on delete buttons using jquery live
$('.del-sscomp').live('click', function() {
    var prnt = $(this).parents(".sscomp-div"); //find the parent div
    var delInput = prnt.find("input[id$=deleted]"); //find the deleted hidden input

	//  mark as deleted and hide div (removing div prevents proper deletion)
	delInput.attr('value','true');
	prnt.hide();
});
</r:script>

<div id="childList">
	<g:if test="${smearSlideInstance.components.size() > 0}">
	    <g:each var="sscomp" in="${smearSlideInstance.components}" status="i">
	        <g:render template='sscomp' model="['sscomp':sscomp,'i':i,'hidden':false]"/>
	    </g:each>
    </g:if>
</div>

<input type="button" value="Add SmearSlideComponent" onclick="addSmearSlideComponent();" />
