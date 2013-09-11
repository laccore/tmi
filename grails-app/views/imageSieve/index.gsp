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
    
    
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
              appSource = sender.getHost().Source;
            }
            
            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
              return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " +  appSource + "\n" ;

            errMsg += "Code: "+ iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {           
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " +  args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
</head>
<body>
	<div class="main_head" style="height:95px">
		<h1 class="nopadding" id="nospace"><a href="https://tmi.laccore.umn.edu"><img style="position:absolute; width: 960px; height: 95px;" src="${resource(dir:'images',file:'tmiHeader.jpg')}" alt="Tool for Microscopic Identification Home" /></a></h1>
		<a href="http://www.nsf.gov" target="_blank"><img style="position:relative;left:860px;bottom:7px;z-index:1000;width:109px;height:109px;" src="${resource(dir:'images',file:'nsf1.gif')}" /></a>
	</div>
<!-- http://timheuer.com/blog/archive/2010/06/10/troubleshooting-debugging-silverlight-cross-domain-xap-hosting.aspx -->
    <form id="form1" runat="server" style="height:100%">
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="100%" height="100%">
		  <param name="source" value="${servletContext.contextPath}/xapResource/xap"/>
		  <param name="onError" value="onSilverlightError" />
		  <param name="background" value="white" />
		  <param name="minRuntimeVersion" value="5.0.61118.0" />
		  <param name="autoUpgrade" value="true" />
		  <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=5.0.61118.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight" style="border-style:none"/>
		  </a>
	    </object><iframe id="_sl_historyFrame" style="visibility:hidden;height:0px;width:0px;border:0px"></iframe></div>
    </form>
</body>
</html>