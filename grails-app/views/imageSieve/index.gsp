<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<!-- saved from url=(0014)about:internet -->
<head>
    <title>TMI ImageSieve</title>
    <style type="text/css">
    html, body {
	    height: 100%;
	    overflow: auto;
    }
    body {
	    padding: 0;
	    margin: 0;
    }
    #silverlightControlHost {
	    height: 100%;
	    text-align:center;
    }
    </style>
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
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'taggable.css')}" />    
</head>
<body>
	<div class="main_head" style="height:95px">
		<h1 class="nopadding" id="nospace"><a href="https://tmi.laccore.umn.edu"><img style="position:absolute; width: 960px; height: 95px;" src="${resource(dir:'images',file:'tmiHeader.jpg')}" alt="Tool for Microscopic Identification Home" /></a></h1>
		<a href="http://www.nsf.gov" target="_blank"><img style="position:relative;left:860px;bottom:7px;z-index:1000;width:109px;height:109px;" src="${resource(dir:'images',file:'nsf1.gif')}" /></a>
	</div>
    <form id="form1" runat="server" style="height:100%">
	    <div id="silverlightControlHost">
    		<embed src="https://suave-dev.sdsc.edu/main/file=briangee_TMI_ImageSieve.csv&views=111000&view=grid" width="100%" height="100%" />
    	</div>
    </form>
</body>
</html>