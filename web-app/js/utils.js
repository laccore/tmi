// used to add additional upload fields in fileResource/upload.gsp
function addUploadField()
{
	var newRow = document.createElement('tr');
	
	var fieldName = "fileUpload"
	newRow.className = "prop";
	newRow.innerHTML = '<td valign="top" class="name"><label for="' + fieldName + '">Upload:</label></td>' +
					   '<td valign="top" class="value ${hasErrors(bean:fileResourceInstance,field:\'upload\',\'errors\')}">' +
					   '<input type="file" id="' + fieldName + '" name="' + fieldName + '" onChange="addUploadField();" multiple/></td>';
	document.getElementById('uploadTableBody').appendChild(newRow);
}