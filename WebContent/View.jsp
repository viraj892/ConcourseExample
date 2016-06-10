<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Database View</title>
</head>
<body>
	<h2><%=request.getAttribute("acknowldgement")%></h2>
	<%
		Map<Long, Map<String, String>> allRecords = (Map<Long, Map<String, String>>) request
				.getAttribute("allrecords");
	%>
	<table>
		<%
			for (long rec : allRecords.keySet()) {
				out.print("<tr><td>Student id:" + rec + "</td>");
				Iterator<Entry<String, String>> it = allRecords.get(rec).entrySet().iterator();
				while (it.hasNext()) {
					Map.Entry<String, String> pair = (Map.Entry<String, String>) it.next();
					out.print("<td><b>" + pair.getKey() + "</b>:" + pair.getValue() + "</td>");
					
					it.remove();
				}
				out.println("</tr>");
			}
		%>
	</table>

	<a href="Details.jsp">Insert a new student</a>

</body>
</html>