
<%@ page import="moviequotes.Moviequote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'moviequote.label', default: 'Moviequote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-moviequote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-moviequote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list moviequote">
			
				<g:if test="${moviequoteInstance?.movie}">
				<li class="fieldcontain">
					<span id="movie-label" class="property-label"><g:message code="moviequote.movie.label" default="Movie" /></span>
					
						<span class="property-value" aria-labelledby="movie-label"><g:fieldValue bean="${moviequoteInstance}" field="movie"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moviequoteInstance?.quote}">
				<li class="fieldcontain">
					<span id="quote-label" class="property-label"><g:message code="moviequote.quote.label" default="Quote" /></span>
					
						<span class="property-value" aria-labelledby="quote-label"><g:fieldValue bean="${moviequoteInstance}" field="quote"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moviequoteInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="moviequote.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${moviequoteInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:moviequoteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${moviequoteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
