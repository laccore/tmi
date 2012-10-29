
<%@ page import="edu.umn.laccore.tmi.Faq" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="umn" />
        <g:set var="entityName" value="${message(code: 'faq.label', default: 'Faq')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>FAQs</h1>      
            <g:each in="${faqInstanceList}" status="i" var="faqInstance">  
                    <h2>${fieldValue(bean: faqInstance, field: "question").decodeHTML()}</h2>             
                    <p style="margin-left:3em; margin-top:1em;">${fieldValue(bean: faqInstance, field: "answer").decodeHTML()}</p>
            </g:each>               
        </div>
    </body>
</html>
