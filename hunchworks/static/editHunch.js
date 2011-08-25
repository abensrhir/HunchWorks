function init()
{
	//code for displaying data in related skills tab
	var hunch_id = document.getElementById('hunch_id').getAttribute('hunch');
	var skill_url = '/hunchworks/skills/hunch/' + hunch_id;
	var language_url = '/hunchworks/languages/hunch/' + hunch_id;
	var userSkills = $.getJSON(skill_url, function(data)
	{
		prePopArray = new Array();
		for(var skill = 0; skill < data.length; skill++)
		{
			prePopArray[skill] = { id: data[skill].id, name: data[skill].name }

		}
		$("#relatedSkills").tokenInput("/hunchworks/skills", { prePopulate: prePopArray, preventDuplicates: true });
	});
	
	//code for diplsaying data in the required languages tab
	var userLanguages = $.getJSON(language_url, function(data)
	{
		prePopArray = new Array();
		for(var skill = 0; skill < data.length; skill++)
		{
			prePopArray[skill] = { id: data[skill].id, name: data[skill].name }

		}
		$("#id_languages").tokenInput("/hunchworks/languages", { prePopulate: prePopArray, preventDuplicates: true });
	});
	
	$("#id_tags").tokenInput("/hunchworks/tags", { theme: 'facebook', preventDuplicates: true});
	
	$("#add_tag_button").click( function()
	{
		alert( document.getElementById('token-input-id_tags').value );
		$("#id_tags").tokenInput("add", { name: document.getElementById('token-input-id_tags').value });
	});
}

$(document).ready(init);