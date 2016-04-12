<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner">


		    <%@ page import="java.io.BufferedReader"
		        page import="java.io.IOException"
		        page import="java.io.InputStream"
		        page import="java.io.InputStreamReader"
		        page import="java.net.URL"
		        page import="java.net.URLConnection"
		        page import="java.net.SocketTimeoutException"
		    %>
		    <%
		        // code to get the availability zone where this page is executing
		        URL url;
		        InputStream is=null;
		        BufferedReader br;
		        String az;

		        try {
                    // the url of the AZ at our local metadata service
                    url=new URL("http://169.254.169.254/latest/meta-data/placement/availability-zone");

                    // open a connection, but set the timeout to 2 seconds
                    URLConnection urlCxn=url.openConnection();
                    urlCxn.setConnectTimeout(2000);
                    urlCxn.setReadTimeout(2000);
                    urlCxn.setAllowUserInteraction(false);
                    urlCxn.setDoOutput(true);

                    is=urlCxn.getInputStream();
                    br= new BufferedReader(new InputStreamReader(is));

                    // we're expecting one line of output from the URL
                    while((line=br.readLine()) !=null) {
                        az=line;

                    }
                }
                catch(SocketTimeoutException ste) {
                    az="localhost";

                }
                catch (Exception e) {
                    e.printStackTrace();

                    try {
                        if (is != null) is.close();
                    }
                    catch (IOException ioe) {
                        // noop
                    }

                } // catch

                out.println("availability zone: " + az);

		    %>

		    <h2><a class="home" href="${createLink(uri: '/')}">Movie Quotes Database</a></h2>

		</div>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
