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
// ��ü ���� ����
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;

%>

<%@ include file = "../common/include/database_connect.inc" %>

<%

try {
	// SQL ���Ǿ� ó��(perform SQL query(DML))
	// �л� ���̺�(customer) �˻�
	String sql = "SELECT * FROM student ORDER BY hakbun ASC";
	pstmt = conn.prepareStatement(sql);
	rset = pstmt.executeQuery();
	
	// �л� ���� �˻� ���
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
   %>
   <%@ include file = "../common/include/database_close.inc" %>
   <% 
}

%>

</table>
</form>
</body>
</html>
