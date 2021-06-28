<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 드라이버 로딩</title>
</head>
<body>
<%
String driverClass = "org.mariadb.jdbc.Driver";

try {
	Class.forName(driverClass);
	out.println("JDBC Driver loading 성공!<br>");
} catch(ClassNotFoundException err) {
	out.println("JDBC Driver loading 실패!!<br>...WEB-INF/lib 폴더 확인<Br>");
}


%>
</body>
</html>
