<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 속성 확인(session_check.jsp)</title>
</head>
<body>
	<b>세션 속성 확인</b><p>
	
	세션 속성(id) : <%=session.getAttribute("id") %><Br>
	세션 속성(name) : <%= session.getAttribute("name") %><Br>
	
<%-- 세션 아이디(SESSIONID) : <%= session.getId() %><p> --%>

	<p><a href="session_delete.jsp">[ 세션 삭제 ]</a>


</body>
</html>