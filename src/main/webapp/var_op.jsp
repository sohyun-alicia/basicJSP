<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변수와 연산자 사용(var_op.jsp)</title>
</head>
<body>
<b>변수와 연산자</b><Br>
<%!
// 선언문
int su1 = 10;
int su2 = 1;
%>

<%
// 스크립트릿(scriptlet)
int result = 0;
int temp = 0;

if ( su1 >= su2 ) {
	result = su1 + su2;
} else {
	// su1과 su2 교환
	temp = su1;
	su1 = su2;
	su2 = temp;
	result = su1 - su2;
}

%>

<!-- 표현식(expression) -->
<%=su1 %><Br>
<%=su2 %><Br>
연산 결과 = <%=result %>

</body>
</html>