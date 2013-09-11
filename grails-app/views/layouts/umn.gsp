<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- University of Minnesota Web template:  v3.090302 -->
    <head>
        <title><g:layoutTitle default="Tool for Microscopic Identification" /></title>
    	<meta name="description" content="" />
		<meta name="keywords" content="" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_reset.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_text.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_template.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_optional.css')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_grails.css')}" />
        <link rel="stylesheet" type="text/css" href="${createLink(controller:'css',action:'template')}" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'umn_print.css')}" media="print" />
        <link rel="stylesheet" type="text/css" href="${createLink(controller:'css',action:'print')}" media="print" />
		<!-- Menu CSS -->
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'default.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'default.ultimate.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'default.ultimate.linear.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'dropdown.css')}" />
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',plugin:'umn-web-template',file:'dropdown.linear.css')}" />
		<!-- taggable plugin CSS -->
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'taggable.css')}" />
		<!-- contact-form plugin -->
		
		
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		
		<g:javascript src="umn_searchfield.js" />
		<g:javascript src="rot13.js" />
		<!-- Menu JS -->
		<!--[if lt IE 7]>
			<g:javascript src="umn/jquery.js" />
			<g:javascript src="umn/jquery.dropdown.js" />
		<![endif]-->
        
        <style type="text/css">
        #main_wrapper{width:95%; max-width:1280px; min-width:720px}
        </style>

        <!-- STYLE SHEETS TO FIX IE -->
        <!--[if IE 6]>
        <style type="text/css" media="screen">
        @import url("${resource(dir:'css',plugin:'umn-web-template',file:'umn_IE6.css')}");
        </style>
        <![endif]-->
        <!--[if IE 7]>
        <style type="text/css" media="screen">
        @import url("${resource(dir:'css',plugin:'umn-web-template',file:'umn_IE7.css')}");
        </style>
        <![endif]-->
        
        <g:layoutHead />
        <g:javascript library="application" />
        
        <!-- Google Analytics -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push([ '_setAccount', 'UA-35618466-1' ]);
			_gaq.push([ '_trackPageview' ]);
		
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl'
						: 'http://www')
						+ '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
		</script>
	</head>
    <body class="center">
    
    <!-- * Skip Links * -->
        <p id="skipLinks">
            <a href="#main_nav">Main navigation</a> | 
            <a href="#maincontent">Main content</a>
        </p>

    <div id="header">
         <sec:ifNotLoggedIn>
		  				<g:link controller="login" action="auth">Login</g:link>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<sec:username /> (<g:link controller="logout">Logout</g:link>)
					</sec:ifLoggedIn>
		<!-- BEGNIN CAMPUS LINKS -->
        <div id="campus_links">
			<p>Campuses: </p>
            <ul>
              <li><a href="http://www.umn.edu">Twin Cities</a></li>
              <li><a href="http://www.crk.umn.edu">Crookston</a></li>
              <li><a href="http://www.d.umn.edu">Duluth</a></li>
              <li><a href="http://www.morris.umn.edu">Morris</a></li>
              <li><a href="http://www.r.umn.edu">Rochester</a></li>
              <li><a href="http://www.umn.edu/campuses.php">Other Locations</a></li>
            </ul>
        </div>
        <!-- END CAMPUS LINKS -->
            
          
        <!-- * BEGIN TEMPLATE HEADER (MAROON BAR)* -->
        <div id="headerUofM">
            <div id="logo_uofm"><a href="http://www.umn.edu/">Go to the U of M home page</a></div>

            <!--BEGIN search div-->
            <div id="search_area">
                <div id="search_nav"><a href="http://onestop.umn.edu/" id="btn_onestop">OneStop</a> <a href="https://www.myu.umn.edu/" id="btn_myu">myU</a></div>
                <div class="search"> 
                   <form action="http://google.umn.edu/search" method="get" name="gsearch" id="gsearch" title="Search U of M Web sites">
                       <label for="search_field">Search U of M Web sites</label>
                       <input type="text" id="search_field" name="q" value="Search U of M Web sites"  title="Search text"  />   
                       <input class="search_btn" type="image" src="${resource(dir:'images',plugin:'umn-web-template',file:'search_button.gif')}" alt="Submit Search" value="Search" />
                       <input name="client" value="searchumn" type="hidden" />
                       <input name="proxystylesheet" value="searchumn" type="hidden" />
                       <input name="output" value="xml_no_dtd" type="hidden" />
                   </form>  
                </div> 
            </div>
        </div>
       <!-- end "search" area -->
    </div>
    <!-- End search div -->
    
    <!-- Navigation stuff, header image, menu -->
	<div class="main_head" style="height:95px">
		<h1 class="nopadding" id="nospace"><a href="https://tmi.laccore.umn.edu"><img style="position:absolute; width: 960px; height: 95px;" src="${resource(dir:'images',file:'tmiHeader.jpg')}" alt="Tool for Microscopic Identification Home" /></a></h1>
		<a href="http://www.nsf.gov" target="_blank"><img style="position:relative;left:860px;bottom:7px;z-index:1000;width:109px;height:109px;" src="${resource(dir:'images',file:'nsf1.gif')}" /></a>
	</div>
	<!-- Gigantic Menu -->
	<ul id="nav" class="dropdown dropdown-linear" style="margin-top:0px; margin-left:0px; width:960px;">
		<li><a href="${createLink(uri: '/')}">Home</a></li>
		<li><g:link controller="quickstart">Quickstart</g:link></li>
		<li><g:link controller="imageSieve">ImageSieve</g:link>
			<ul>
				<li>Note: ImageSieve is machine-intensive and will take a moment to load.</li>
			</ul>
		</li>
		<li><g:link controller="inorganic" action="all">Inorganic</g:link>
				<!--
				<li><g:link controller="inorganic" action="list" params="[id: 'a']">A</g:link></li>
				-->
				<tmi:mineralLinks/>
		</li>
		<li><g:link controller="organic" action="all">Organic</g:link>
			<tmi:organicLinks/>
		</li>
		<li><g:link controller="module" action="blog">Tutorials</g:link></li>
		<li><g:link controller="help" action="show">Help</g:link>
			<ul>
				<li><g:link controller="help" action="show" fragment="contribute">How to Contribute</g:link></li>
				<li><g:link controller="faq" action="all">FAQ</g:link></li>
				<li><g:link controller="help" action="show" fragment="about">About</g:link></li>
				<li><g:link controller="help" action="show" fragment="copyright">Copyright</g:link></li>
				<li><g:link controller="help" action="show" fragment="citation">Citation</g:link></li>
				<li><g:link controller="help" action="show" fragment="contact">Contact</g:link></li>
				<!--<li><script type="text/javascript">Rot13.write("<n uers='znvygb:nzleob@hza.rqh?fhowrpg=GZV%20jrofvgr'>Pbagnpg</n>");</script></li>-->
			</ul>
		</li>
		<li><a href="http://lrc.geo.umn.edu/laccore/">LacCore</a></li>
		<sec:ifAllGranted roles="ROLE_ADMIN">
		<li><g:link controller="admin" action="index">Admin</g:link></li>
		</sec:ifAllGranted>
		<li id="tmiMenuSearchItem"><span><g:form url='[controller: "searchable", action: "index"]' id="searchableForm"  name="searchableForm" method="get">
        	<g:textField class="input" name="q" value="${params.q}" size="30" style="border-style:inset;"/> <input id="tmiMenuSearchButton" type="submit" value="Search"/>
        	<g:hiddenField name="max" value="25"/></g:form></span>
        </li>
	</ul>
	
	<!-- Space for second menu row -->
	<div style="height:60px;">&nbsp;</div>
	
    <div id="spinner" class="spinner" style="display:none;">
		<img src="${resource(dir:'images',plugin:'umn-web-template',file:'spinner.gif')}" alt="Spinner" />
	</div>	
	


	<g:layoutBody />
	<r:layoutResources disposition="defer"/>



    <!-- BEGIN OPTIONAL UNIT FOOTER -->
    <div class="grid_12" id="unit_footer2">
        <ul class="unit_footer_links">
            <li>Address: 310 Pillsbury <acronym class="acronym_border" title="Drive South-East">Dr SE</acronym>, Minneapolis, MN 55455 Phone: 612-626-7889</li><li><script type="text/javascript">Rot13.write("<n uers='znvygb:nzleob@hza.rqh?fhowrpg=GZV%20jrofvgr'>Pbagnpg</n>");</script></li>
        </ul>
    </div>
    <!-- END OPTIONAL UNIT FOOTER -->


    <!-- BEGIN UofM FOOTER -->
    <div class="grid_7" id="footer_left">
        <ul class="copyright" style="font-size:10px"><li>&copy; 2011 Regents of the University of Minnesota. All rights reserved.</li>
        <li>The University of Minnesota is an equal opportunity educator and employer</li>
        <li>Last modified on July 24, 2011</li></ul>
    </div>
    <div class="grid_5" id="footer_right">
        <ul class="footer_links">
        <li>Twin Cities Campus: </li>
        <li><a href="http://www1.umn.edu/pts/">Parking &amp; Transportation</a></li>
        <li><a href="http://www.umn.edu/twincities/maps/index.html">Maps &amp; Directions</a></li></ul>
        <br class="clearabove" />
        <ul class="footer_links"><li><a href="http://www.directory.umn.edu/">Directories</a></li>
        <li><a href="http://www.umn.edu/twincities/contact/">Contact U of M</a></li>
        <li><a href="http://www.privacy.umn.edu/">Privacy</a></li>
        </ul>
        <p>&nbsp;</p>
        <br class="clearabove" />
    </div>
    <!-- END UofM FOOTER -->
    </body>	
</html>
