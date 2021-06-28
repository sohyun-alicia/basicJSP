<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <title>response 내장객체 강제 이동(response_redirect_form.jsp)</title>
 <meta charset="UTF-8">
 <style>
 table {width:200px; text-aligh:center; border-collapse:collapse;}
 caption {font-size:20pt; font-weight:bold;}
 th, td {border:1px solid grey; padding:3px;}
 th {width:50%; background-color:#CFD0ED;}
 td {text-align:left;}
 </style>
</head>
<body>
	<form name="login_form" method="POST" action="./response_redirect_check.jsp">
	<table>
		<caption>redirect 폼</caption>
		<tr>
			<th>아 이 디</th>
			<td><input type="text" name="cust_id" size="10" maxlength="10" required autofocus></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="cust_pw" size="11" maxlength="10" required></td>
			</tr>
			<tr>
				<td colspan="2" stype="text-align:center;">
					<input type="submit" value="전송">
					<input type="reset" value="취소"></td>
			</tr>
		
			</table></form>

</body>
</html>