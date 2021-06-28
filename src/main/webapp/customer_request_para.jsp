<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%--post방식 한글 데이터 전송 경우 깨짐 현상 방지 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 파라미터(customer_request_para.jsp)</title>
</head>
<body>
<b>회원가입 요청 파라미터 처리</b><Br>

<% // 전송 정보(요청 파라미터) - 단일 값 %>
아이디 : <%= request.getParameter("id") %><Br>
비밀번호 : <%= request.getParameter("pw") %><Br>
이 름 : <%= request.getParameter("name") %><Br>
성 별 : <%= request.getParameter("gender") %><Br>
취 미 :

<% // 전송 정보(요청 파라미터) - 다중 값
String[] hobby = request.getParameterValues("hobby");

if (hobby != null) {
	
	for (int i = 0; i < hobby.length; i++){
		out.print(hobby[i] + " ");
	}
		
} else {
	out.print("취미를 선택하지 않았습니다!"+"<Br>");
}
%>


</body>
</html>