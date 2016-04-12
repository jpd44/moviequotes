<%@ page import="moviequotes.Moviequote" %>



<div class="fieldcontain ${hasErrors(bean: moviequoteInstance, field: 'movie', 'error')} ">
	<label for="movie">
		<g:message code="moviequote.movie.label" default="Movie" />
		
	</label>
	<g:textField name="movie" maxlength="50" value="${moviequoteInstance?.movie}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: moviequoteInstance, field: 'quote', 'error')} ">
	<label for="quote">
		<g:message code="moviequote.quote.label" default="Quote" />
		
	</label>
	<g:textArea name="quote" cols="40" rows="5" maxlength="300" value="${moviequoteInstance?.quote}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: moviequoteInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="moviequote.role.label" default="Role" />
		
	</label>
	<g:textField name="role" maxlength="50" value="${moviequoteInstance?.role}"/>

</div>

