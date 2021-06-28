<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>
    
<% // 전송 한글 데이터 처리
	request.setCharacterEncoding("UTF-8");	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 및 세션 설정(db_login_check.jsp)</title>
</head>

<body>

<%
	// 객체 참조 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
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
		
		// SQL 질의어 처리(Perform SQL query(DML))
		// 전송 데이터 변수 할당
		String hakbun = request.getParameter("hakbun");
		
		// 학생 테이블(studen) 튜플 검색
		String sql = "select * from student where hakbun = ?";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hakbun);
		rset = pstmt.executeQuery();
		
		// 질의처리 결과(rset) 체크 - 커서 초기 상태
		if (!rset.isBeforeFirst()) {
			
			// 자바 스크립트
			out.print("<script>alert('존재하지 않는 학생입니다.');"
						+ "history.back();"
						+ "</script>");
		}
		
		// 학생 정보 추출(학번, 이름)
		out.println("학생 테이블(student) 검색 성공<Br>");
		
		rset.next();			// 커서 현재 위치 다음 행으로 이동
		String db_hakbun = rset.getString("hakbun");
		String db_name = rset.getString("name");
		
		// 로그인 인증 및 세션 객체의 속성(세션 변수) 설정
		if (hakbun.equals(db_hakbun)) {
			
			session.setAttribute("hakbun", db_hakbun);
			session.setAttribute("name", db_name);
			out.print(session.getAttribute("hakbun") + "("
					+ session.getAttribute("name") + ")님 방문을 환영합니다.<Br>");
		}
		
	} catch(SQLException sqlerr) {
		out.println("MariaDB 서버 연결 실패!!<Br>");
		out.println(sqlerr.getMessage() + "<Br>");
		
	} finally {
		// 데이터베이스 연결 종료(close database)
		if (rset != null) {
			try{
				rset.close();
				out.println("resultSet_close!<Br>");
			} catch (SQLException sqlerr) {}
		}
		if (pstmt != null) {
			try{
				pstmt.close();
				out.println("Statement_close!<Br>");
			} catch (SQLException sqlerr) {}
		}
		if (conn != null) {
			try {
				conn.close();
				out.println("MariaDB 서버 연결 종료!<Br>");
			} catch(Exception conerr) {}
		}
	}

	
	// 지정 페이지(URL)로 강제 이동
	// response.sendRedirect("./db_std_ins_form.jsp");
	
	%>
	
	<p><a href="./db_std_ins_form.jsp">[ 로그인 폼 ]</a>
	
</body>
</html>