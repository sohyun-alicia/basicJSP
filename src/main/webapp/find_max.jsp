<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택문 if_else(find_max.jsp)</title>
</head>
<body>
<b>큰 수 찾기</b><Br>

<% 
	// 변수 선언
	int su1 = 91;
	int su2 = 49;
	int max;
	
	// 큰 수 찾기
	if (su1 >= su2) {
		max = su1;
	} else {
		max = su2;
	}
%>

수1 = <%=su1 %>, 수2 = <%=su2 %><Br>
큰 수 = <%=max %>

</body>
</html>