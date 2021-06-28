<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% // 전송 한글 데이터 처리
	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 테이블(student) 학생 정보 저장(std_ins_db.jsp))</title>

</head>
<body>

	<%
	// 객체 참조 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// JDBC 드라이버 로딩(loading JDBC driver)
	String driverClass = "org.mariadb.jdbc.Driver";
	
	try {
		Class.forName(driverClass);
		out.println("JDBC Driver load 성공!<br>");
	} catch(ClassNotFoundException err) {
		out.println("JDBC Driver load 실패...WEB-INF/lib 폴더 확인");
	}
	
	// MariaDB 서버 연결(connect server)
	// "jdbc:mariadb://server_IP:3306/database_name"
	String url = "jdbc:mariadb://localhost:3306/univ";
	String id = "root";
	String pw = "1111";
	
	
	try{
		conn = DriverManager.getConnection(url, id, pw);
		out.println("MariaDB 서버 연결 성공!<Br>");
	} catch(SQLException sqlerr) {
		out.println("MariaDB 서버 연결 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");
	}
		
	// SQL 질의어 처리(Perform SQL query(DDL))
	// 대학 데이터베이스(univ) 생성
	try {
		String hakbun = request.getParameter("hakbun");
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String dept = request.getParameter("dept");
		String addr = request.getParameter("addr");
		
		
		// 학생 테이블(student) 튜플 삽입
		String sql = "insert into student values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hakbun);
			pstmt.setString(2, name);
			pstmt.setString(3, year);
			pstmt.setString(4, dept);
			pstmt.setString(5, addr);
		pstmt.executeUpdate();
		out.println("학생 테이블 생성 성공!<br>");
		
	} catch (SQLException sqlerr) {
		out.println("학생 테이블(student) 튜플 삽입 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");
		
	} finally {
		// 데이터베이스 연결 종료(close database)
		if (pstmt != null) {
			try {
				pstmt.close();
				out.println("Statement_close!<Br>");
			} catch(SQLException sqlerr) {}
		}
		if (conn != null) {
			try {
				conn.close();
				out.println("MariaDB 서버 연결 종료!<Br>");
			} catch (Exception conerr) {}
		}
	}
	
	
	// 지정 페이지(URL)로 강제 이동
	// response.sendRedirect("./std_ins_form.jsp");
	%>
	
	<a href="./std_ins_form.jsp">[ 학생 정보 입력 폼 ]</a>

</body>
</html>