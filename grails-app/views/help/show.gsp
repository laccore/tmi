<html>
  <head>
	  <meta name="layout" content="umn" />
	  <title>TMI - Smear Slides - Help</title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;
	  			overflow:auto;
	  			height: 300px;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>

  <body>
  	<div id="pageBody">
  		<a name="contribute"></a>
  		<h1>How to Contribute</h1>
  		<p style="margin-left:3em; margin-top:1em;">
  			TMI welcomes photomicrographs of identified sedimentary components, assemblages, and lithofacies submitted by any researcher.  
  			Basic metadata is required for each image.  Download 
			<a href="${resource(dir:'resources',file:'ImageUploadTemplate.xlsx')}" target="_blank">template</a>
			and <a href="${resource(dir:'resources',file:'TemplateInstructions.pdf')}" target="_blank">instructions</a>. 
  		</p>
  		
  		<a name="faq"></a>
  		<h1>FAQ</h1>
  		<p style="margin-left:3em; margin-top:1em;">
  			Located <g:link controller="faq" action="all">here</g:link>
  		</p>
  		
		<a name="about"></a>
		<h1>About</h1>
		<p style="margin-left:3em; margin-top:1em;">
			<ul>
				<li>Version <g:meta name="app.version"/></li>
				<li>
					TMI is funded by a University of Minnesota Interdisciplinary Informatics Seed Grant, is hosted at the Minnesota Supercomputer Institute, and benefits from the infrastructure provided by LacCore, funded by the National Science Foundation and the University of Minnesota.
				</li>
				<li>
					Subject matter experts have contributed images and information to TMI. We deeply appreciate their time and energy, and the support of their institutions. Thanks to: Andy Breckenridge, Univ of Wisconsin-Superior; Andy Cohen, Univ. of Arizona; Mark Edlund, St. Croix Watershed Research Station; Michael Rosen, USGS; Guy Rothwell, BOSCORF, NOC, UK; Mark Shapley, Idaho State Univ.; Joe Smoot, USGS; and Blas Valero-Garces, Pyrenean Inst. of Ecology. 
				</li>
				<li>
					TMI is dedicated to the memory of Mike Talbot, whom we wish were here to help us, and of course to Kerry Kelts, whose project we are trying to complete.
				</li>
			</ul>	
		</p>
		<a name="copyright"></a>
		<h1>Copyright</h1>
		<p style="margin-left:3em; margin-top:1em;">
			Images and text on the website may be used without permission, but should be credited as having been provided by the LacCore TMI website
		</p>
		<a name="citation"></a>
		<h1>Citation</h1>
		<p style="margin-left:3em; margin-top:1em;">
			<ul>
				<li>
					Please provide proper attribution for any use of images or text from the website in a presentation or publication. Citation of TMI helps to spread the word about its availability, and is crucial to securing continued funding of the resource.
				</li>
				<li>
					Any publication that uses data obtained from this web site should cite TMI as follows:<br/>
					Myrbo, A., Morrison, A., and McEwan, R. (2011). Tool for Microscopic Identification (TMI). http://tmi.laccore.umn.edu.  Accessed on <g:formatDate format="dd MMMMM yyyy" date="${new Date()}"/>
				</li>
				<li>
					We prefer that users include a citation in the references section of a publication, rather than listing TMI in the acknowledgments section.
				</li>
				<li>
					We also request that users send us the Digital Object Identifier (DOI) of any published work that cites TMI.
				</li>
			</ul>
		</p>
		
		<a name="contact"></a>
		<h1>Contact</h1>
		<p style="margin-left:3em; margin-top:1em;">
			If you have questions or comments about this site, or if you would like to contribute images or information, please contact Amy Myrbo, amyrbo_at_umn_dot_edu, using the <g:link controller="contactForm">feedback form</g:link>.
		</p>
		<p style="margin-left:3em; margin-top:1em;">
			To subscribe to the TMI discussion listserv:<br/>
			send an email to listserv@lists.umn.edu with the message "subscribe tmi-list &lt;your name&gt;"
		</p>
		<sec:ifAllGranted roles="ROLE_ADMIN">
  		<h1>Misc Admin-Related</h1>
  		<p style="margin-left:3em; margin-top:1em;">
			Template Management: plugin command apply-umn-template copies umn.gsp using "Ant.copy(file: "${umnWebTemplatePluginDir}/src/templates/umn.gsp", 
		todir: "${basedir}/grails-app/views/layouts")"", but only if it is newer than umn.gsp in the destination.  There are two ways to manage this template. 1) always modify the original or 2) modify the copy at the destination of the above ant task.  This project has taken the second approach.
		You do not need to run apply-umn-template command to have template changes reflected in the app.  Re-run the command only when there are new views to which the template should be applied.
		</p>
		<p style="margin-left:3em; margin-top:1em;">
			Image Management: HTML image tags require that the src attribute use paths relative to the file they are in or "absolute paths" relative to the server name, e.g. src="/Users/rmcewan/images/img.jpg" translates to http://localhost/Users/rmcewan/images/img.jpg.  Absolute file paths on the filesystem are not an option.
			Therefore, the best way to get test in sync with prod is to scp the images dir on prod to your local dev environment, then place it in the STS project and deploy a copy of the app to the test environment.
			This approach also covers getting your dev environment to reflect the images in prod - but you will need the current prod db to make the most use of the copied images.
			<br/>Use something like ""scp -r mcewanr@db2.msi.umn.edu:/website/tmi.msi.umn.edu/prod/apache-tomcat-6.0.33/webapps/ROOT/images/* Desktop/prodImages
			or Fugu/WinSCP, etc.
		</p>
		<h1>Editing the Interactive Key</h1>
		<p style="margin-left:3em; margin-top:1em;">
			An example - the original version of the tool had the 'Is Rhomobedral' edge taking the user directly to the terminal node (UniqueIdentification) of Dolomite. 
			This edge really should have connected to another Question about depositional environment.
			That new question node should have two edges (lacustrine and marine) that terminate in UniqueIdentifications of Calcite and Dolomite.  To do this:
			<ul>
				<li>Create a new Question - "What is the depositional environment?"  (or similar)</li> 
				<li>Define two new edges - "Lacustrine" and "Marine" with the source node set to this new question and target nodes to the the existing Calcite and Dolomite nodes</li>
				<li>Reset the rhombohedral edge's target node from Dolomite to the new depostional environment node</li>
			</ul>
		<p style="margin-left:3em; margin-top:1em;">
			A general rule is that you should not try to add/edit/delete Nodes - they are for display only.  
			If you are Modifying the key, then work with only MulitipleValues, UniqueIdentifications, Questions, and Edges.
		</p>
		<h1>Taggable Table Schema and Example Data</h1>
		<pre>
			mysql> select * from tags;
			+----+---------+-------------+
			| id | version | name        |
			+----+---------+-------------+
			|  1 |       0 | chonchoidal | 
			|  2 |       0 | clear       | 
			|  3 |       0 | coral       | 
			|  4 |       0 | cleavage    | 
			+----+---------+-------------+
			4 rows in set (0.00 sec)
			
			mysql> select * from tag_links;
			+----+---------+--------+---------+----------------------+
			| id | version | tag_id | tag_ref | type                 |
			+----+---------+--------+---------+----------------------+
			|  1 |       0 |      1 |      47 | uniqueIdentification | 
			|  2 |       0 |      2 |      47 | uniqueIdentification | 
			|  3 |       0 |      3 |      39 | uniqueIdentification | 
			|  4 |       0 |      4 |      55 | uniqueIdentification | 
			|  5 |       0 |      4 |      54 | uniqueIdentification | 
			+----+---------+--------+---------+----------------------+
			5 rows in set (0.00 sec)
		</pre>
		</p>
		
		
		</sec:ifAllGranted>
	</div>
  </body>
</html>
