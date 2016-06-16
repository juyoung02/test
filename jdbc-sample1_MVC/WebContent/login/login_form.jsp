<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%
if(session.getAttribute("id") == null) {
	%>
	<h2>로그인 페이지</h2>
	<form action="login_ctl.jsp" method="post">
	ID: <input name="id" type="text">
	<br /> 비밀번호 : <input name="passwd" type="password"> 
	<br /><button> 로그인</button>
	</form>
	<%
	}
	%>
</body>
</html>