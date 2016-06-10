<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Student Information</title>
</head>
<body>
	<h1>Enter details of a new student</h1>
	<form action="ConcourseDBOperations" method="get">
		<table>
			<tr>
				<td><label>ID:</label></td>
				<td><input type="number" name="id"></td>
			</tr>
			<tr>
				<td><label>Name:</label></td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><label>Age:</label></td>
				<td><input type="number" name="age"></td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td><label>Zipcode:</label></td>
				<td><input type="number" name="zip"></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>