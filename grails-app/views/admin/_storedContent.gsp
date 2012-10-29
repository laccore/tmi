<%
//x = '${resource(dir:"resources",file:"SmearSlideTable.xls")}'
//x = c.content
//str = ( new GroovyShell ( ) ).evaluate ( '"' + x + '"' )
//def str = new groovy.text.GStringTemplateEngine().createTemplate(x).make().writeTo(new StringWriter()).toString()
//out << str

%>

<% out <<  c.content.toString() %>

<a href="${webRequest.contextPath}/resources/SmearSlideTable.xls">Smear Slide Table.xls</a> 
