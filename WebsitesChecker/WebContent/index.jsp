
<%@page import="java.io.IOException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Properties"%>
<%@page import="de.eitco.wc.*" %>
<%@page import="java.net.URL"%>
<%@page import="java.util.List"%>
<%@page isThreadSafe="false"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="60" />



	<style>
	table, th, td {
	    border: 1px solid black;
	    border-collapse: collapse;    
    	background-color: #f1f1f1;
	}
	th, td {
	    padding: 5px;
	}
	
	th{
	    background-color: bisque;	    
	    text-align: center;
	}
	</style>
	<title>Website Checker</title>
</head>
<body>
<br>
<% 
Properties urls = WebsiteChecker.getUrls();
URL ressource = Thread.currentThread().getContextClassLoader().getResource("sites.properties");
if(urls.isEmpty()) {
	
	out.println("Es wurden keine URLs in der Ressource '"+ressource.toString()+"'");
} else {
	
	%>
	
	<table style="width:75%" align="center">
    <tr>
      <th>Webapp</th>
      <th>URL</th>
      <th>Verfügbarkeit</th>
    </tr>
  	

  <% 	
	for(Entry<Object, Object> url : urls.entrySet()){
		%>
		<tr><td><%
		String key = url.getKey().toString().trim().replace("_", " ");
		 out.print(key);
	      %></td><td><a target="_blank" href="<%=url.getValue()%>"><%=url.getValue()%></a></td><%
	    		  
    		  try{
				if(WebsiteChecker.urlExists(url.getValue().toString())) {
					%><td style="background-color: darkseagreen;"><%
					out.println("erreichbar");
				} else {
					%><td style="background-color: coral;"><%
					out.println("nicht erreichbar");
				}
    		  }catch (IOException e){
    			  %><td style="background-color: coral;"><%
    						out.println(e.getClass().getSimpleName()+": " + e.getLocalizedMessage()); 
    		  }
	      %></td></tr><%
		}
	}
	%>
	</table>
	<br>
	<table style="width:75%" align="center" style="font-size: 12px; border: 3px solid green;">
		<tr>
	      <td style="background-color: cornsilk;">- Konfiguration auf <b><i><%=InetAddress.getLocalHost()%></i></b> unter: <i><%=ressource.toString()%></i>
	      	<br>- Seite aktualisiert sich alle 60 Sekunden automatisch.
	      </td>
	    </tr>		
	</table>


</body>
</html>