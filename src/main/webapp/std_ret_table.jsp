<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import ="java.sql.*" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../common/CSS/table_retrieval.css">
<title>�л� ���̺� �л� ���� �˻�</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;

String driverClass = "org.mariadb.jdbc.Driver";

try {
	Class.forName(driverClass);
	out.println("JDBC Driver loading ����!<br>");
} catch(ClassNotFoundException err) {
	out.println("JDBC Driver loading ����!!<br>");
}
String url = "jdbc:mariadb://localhost:3306/univ";
String id = "root";
String pw = "1111";
try {
	conn = DriverManager.getConnection(url, id, pw);
	out.println("MariaDB ���� ���� ����!<br>");
	String sql = "SELECT * FROM student ORDER BY hakbun ASC";
	pstmt = conn.prepareStatement(sql);
	rset = pstmt.executeQuery();
	
%>
<form name="student_form_table">

<table>
<caption>�л� ���� �˻�</caption>
<tr>
<th>�� ��</th>
<th>�� ��</th>
<th>�� ��</th>
<th>�� ��</th>
<th>�� ��</th>
</tr>

<%
	while (rset.next()) {
		String hakbun = rset.getString("hakbun");
		String name = rset.getString("name");
		String year = rset.getString("year");
		year = year + "�г�";
		String dept = rset.getString("dept");
		String addr = rset.getString("addr");
%>
<tr>
<td><%=hakbun%></td>
<td><%=name%></td>
<td><%=year%></td>
<td><%=dept%></td>
<td><%=addr%></td>
</tr>
	
<%
	}

} catch (SQLException sqlerr) {
	out.println("SQL ����ó�� ����!" + "<br>");
	out.println(sqlerr.getMessage() + "<br>");

} finally {
   // �����ͺ��̽� ���� ����(close database)
   if (pstmt != null) {
       try {
          pstmt.close();
          out.println("Statement_close!<Br>");
       } catch (SQLException sqlerr) {}
   }
   if (conn != null) {
      try {
         conn.close();
         out.println("MariaDB ���� ���� ����!<Br>");
      } catch (Exception conerr) {}
   }
}

%>

</table>
</form>
</body>
</html>
