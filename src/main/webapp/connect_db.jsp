<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결</title>
</head>
<body>
<%

// JDBC 드라이버 로딩(loading JDBC driver)
String driverClass = "org.mariadb.jdbc.Driver";

try {
	Class.forName(driverClass);
	out.println("JDBC Driver loading 성공!<br>");
} catch(ClassNotFoundException err) {
	out.println("JDBC Driver loading 실패!!<br>");
}

// MariaDB 서버 연결(connect server)
// "jdbc:mariadb://server_IP:3306/database_name"
String url = "jdbc:mariadb://localhost:3306/univ";
String id = "root";
String pw = "1111";

Connection conn = null;

try {
	conn = DriverManager.getConnection(url,id,pw);
	out.println("MariaDB 서버 연결 성공!<br>");
} catch (SQLException sqlerr) {
	out.println("MariaDB 서버 연결 실패!!<br>");
	out.println(sqlerr.getMessage() + "<br>");
	
} finally {
	// 데이터베이스 연결 종료(close database)
	if (conn != null) {
		try {
			conn.close();
			out.println("MariaDB 서버 연결 종료!<br>");
		} catch (Exception conerr) {
			conerr.printStackTrace();
		}
	}
}

%>
</body>
</html>
