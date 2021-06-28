<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% // 한글 파라미터 post 전송 경우
	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 및 세션 설정(login_check.jsp)</title>
</head>
<body>


<% 
	// DB 고객 정보
	String user_id = "root";
	String user_pw = "admin";
	String user_name = "관리자";
	
	// 전송 데이터 변수 할당 및 확인
	String cust_id = request.getParameter("cust_id");
	String cust_pw = request.getParameter("cust_pw");
	
	if (cust_id.isEmpty() || cust_pw.isEmpty()) {
		out.print("<script>alert('아이디와 비밀번호를 입력하시오.');"
					+ "history.back();"
					+ "</script>");		
	}
	
	// 로그인 인증 및 세션 설정(DB 검색)
	if (cust_id.equals(user_id) && cust_pw.equals(user_pw)) {
		
		// 세션 객체의 속성(세션 변수) 설정
		session.setAttribute("cust_id", user_id);
		session.setAttribute("cust_name", user_name);
		
		out.print("<b>" + session.getAttribute("cust_id") + "("
				+ session.getAttribute("cust_name") + ")님 방문을 환영합니다!</b><p>");
	} else {
		
		out.print("<b>회원 가입 후 방문하십시오!</b><p>");
	}
	%>
	
	세션 속성(cust_id) : <%= session.getAttribute("cust_id") %><Br>
	세션 속성(cust_name) : <%= session.getAttribute("cust_name") %><p>
	
	<%
	// 지정 페이지(URL)로 강제 이동
	// response.sendRedirect("./login_form.jsp");
	%>
	
	<p><a href="./login_form.jsp">[ 로그인 폼 ]</a>
</body>
</html>