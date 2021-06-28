<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 내장 객체(request_data.jsp)</title>
</head>
<body>
<p>
	<b>request 내장 객체 - [전송 데이터관련 정보]</b><Br>
	요청정보 프로토콜 : <%= request.getProtocol() %><Br>
	요청정보 전송 방식 : <%= request.getMethod() %><Br>
	요청정보 컨텐츠 타입 : <%= request.getContentType() %><Br>
	요청정보 인코딩 : <%= request.getCharacterEncoding() %><Br>
	요청정보 길이 : <%= request.getContentLength() %></p>
<p>	
	컨텍스트 경로 : <%= request.getContextPath() %><Br>
	요청 URI : <%= request.getRequestURI() %><Br>
	요청 URL : <%= request.getRequestURL() %><Br>
	요청 서블릿 경로 : <%= request.getServletPath() %></p>
<p>
	쿠기 정보 : <%= request.getCookies() %><Br>
	세션 아이디 : <%= request.getRequestedSessionId() %><Br>
	세션 정보 : <%= request.getSession() %></p>

</body>
</html>