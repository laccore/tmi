<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<%@ page import="edu.umn.laccore.tmi.SearchableResultService" %>
<%@ page import="edu.umn.laccore.tmi.Image" %>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="layout" content="umn" />
    <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>TMI - Smear Slides</title>
    <!-- <style type="text/css">
      * {
        font-family: Arial, sans-serif;
        padding: 0;
        margin: 0;
      }

      body {
        font-size: 0.9em;
        padding: .5em;
      }

      #header form input {
        padding: .1em;
      }

      #header .hint {
        color: gray;
      }

      #header h1 a {
        text-decoration: none;
        font-family: Georgia, serif;
          color: dimgray;
      }

      #header h1 {
          letter-spacing: -0.1em;
          float: left;
      }

      #header h1 span {
          font-family: Georgia, serif;
          color: #424242;
      }

      #header form {
          margin-left: 22em;
          padding-top: .1em;
      }

      .title {
        margin: 1em 0;
        padding: .3em .5em;
        text-align: right;
        background-color: seashell;
        border-top: 1px solid lightblue;
      }

      .result {
        margin-bottom: 1em;
      }

      .result .displayLink {
        color: green;
      }

      .result .name {
        font-size: larger;
      }


      ul {
        margin: 1em 2em;
      }

      li, p {
        margin-bottom: 1em;
      }
    </style> -->

 	<style type="text/css">
	.paging a.step {
	  padding: 0 .3em;
	}
	
	.paging span.currentStep {
	    font-weight: bold;
	}
	</style>

    <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("q").focus();
        }
    </script>
  </head>
  <body onload="focusQueryInput();">
  <div id="header">
    <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
        <g:textField class="tmiSearchField" name="q" value="${params.q}" size="50"/>
        <button type="submit">Search</button>
        <g:hiddenField name="max" value="25"/>
        <g:hiddenField name="suggestQuery" value="true"/>
    </g:form>
  </div>
  <h4>&nbsp;</h4>
  <div id="main">
    <g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    <div class="title">
      <span>
        <g:if test="${haveQuery && haveResults}">
          Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
          results for <strong>${params.q}</strong><br/>
        </g:if>
        <g:else>
        &nbsp;
        </g:else>
      </span>
    </div>

    <g:if test="${haveQuery && !haveResults && !parseException}">
      <p>Nothing matched your query - <strong>${params.q}</strong></p>
    </g:if>

    <g:if test="${searchResult?.suggestedQuery}">
      <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
    </g:if>

    <g:if test="${parseException}">
      <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
      <p>Suggestions:</p>
      <ul>
        <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
        <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
              <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
          </li>
          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
              <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
              <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
          </li>
        </g:if>
      </ul>
    </g:if>

    <g:if test="${haveResults}">
      <div class="results">
        <%--<g:each var="result" in="${searchResult.results}" status="index">
          <div class="result">
            <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
            <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
            <div class="name"><a href="${link}">${className} #${result.id}</a></div>
            <g:set var="desc" value="${result.toString()}" />
            <g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
            <div class="desc">${desc.encodeAsHTML()}</div>
            <div class="displayLink">${link}</div>
          </div>
         </g:each>
          
          --%>
          <g:each var="result" in="${searchResult.results}" status="index">
	          <div class="result">
	            <g:set var="className" value="${SearchableResultService.domainClassName(result)}" />
	            <g:set var="link" value="${SearchableResultService.createLink(request,result)}" />
	            <div class="name"><a href="${link}">${SearchableResultService.userFacingDomainClassName(result)}: ${SearchableResultService.userFacingInstanceName(result)}</a></div>
	            <!-- display image if className==Image -->
	            <g:if test="${className=='Image'}">
	            	<!--load Image instance-->
	            	<g:set var="image" value="${Image.load(result.id)}"/>
	            	<img style="max-height:125px; max-width:125px;"
							src="${createLinkTo(dir:image.viewDir(), file:image.filenameThumb)}"
							alt="${image.filenameThumb}"
							title="${image.uniqueIdentification?.name}" />
	            </g:if>
	            <g:set var="desc" value="${SearchableResultService.userFacingDescription(result)}" />
	            <g:if test="${desc?.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
	            <div class="desc">${desc?.encodeAsHTML()}</div>
	            <%--<div class="displayLink">${link}</div>--%><br/>
	          </div>
        </g:each>
      </div>

      <div>
        <div class="paging">
          <g:if test="${haveResults}">
          		<br/>
              Page:
              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
              <g:else><g:paginate controller="searchable" action="index" params="[q: params.q]" total="${searchResult.total}" max="25" prev="&lt; previous" next="next &gt;"/></g:else>
          </g:if>
        </div>
      </div>
    </g:if>
  </div>
  </body>
</html>
