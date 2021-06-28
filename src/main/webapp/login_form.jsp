<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	// 세션 객체의 속성 확인
	String cust_id = (String)session.getAttribute("cust_id");
	String cust_name = (String)session.getAttribute("cust_name");
	Boolean login = false;
	
	if ((cust_id != null) && (cust_name != null)) {
		login = true;		// 로그인 상태
	}
%>

<!DOCTYPE html>
<html>
<head>
 <title>세션 로그인 폼(login_form.jsp)</title>
 <meta charset="UTF-8">
 <style>
 table {width:250px; text-align:center; border-collapse:collapse;}
 caption {font-size:20pt; font-weight:bold;}
 th, td {border: 1px solid grey; padding: 2px;}
 th {width:50%; background-color:#CFD0ED;}
 td {text-aligh:left;}
 </style>
</head>


<body>
	<form name="login_form" method="POST" action="./login_check.jsp">
		<table>
			<caption>로그인 폼</caption>
			<tr>
				<th>아 이 디</th>
				<td><input type="text" name="cust_id" size="10" maxlength="10" required autofocus></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="cust_pw" size="11" maxlength="10" required></td>
			</tr>
			<tr>
				<td colspan="2" style="text-aligh:center;">
				
	<%
	if (login) { //로그인 경우 버튼 상태
		out.print("<input type='submit' value='로그인' disabled>"
				+ "<input type='button' value='(" + cust_name + ")님 로그아웃'"
				+ "onClick=location.href='./logout.jsp'></td>");
	
	} else {
		out.print("<input type='submit' value='로그인'>"
				+ "<iput type='button' value='로그아웃' disabled></td>");
	}
	%>
	</td>
	</tr>
		</table>
	</form>


</body>
</html>