<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
</head>
<body>
	<table>
		<tr>
			<td>${isbn}</td>
		</tr>
			<tr>
			<td>${title}</td>
		</tr>
		<tr>
			<td>${publisher}</td>
		</tr>
		<tr>
			<td>${priceMin}</td>
			<td><span>~</span></td>
			<td>${priceMax}</td>
		</tr>
		<tr>
			<td>${dateMin}</td>
			<td><span>~</span></td>
			<td>${dateMax}</td>
	</table>
</body>
</html>