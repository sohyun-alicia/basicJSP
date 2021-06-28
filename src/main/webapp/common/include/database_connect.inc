	<%
	// file = "../common/include/database_connect.inc"

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
		out.println("데이터베이스 연결 성공!<Br>");

	} catch (SQLException sqlerr) {
	System.out.println("데이터베이스 연결 오류! " + sqlerr.getMessage());
	}
		
	%>