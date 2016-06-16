<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.rp.DBUtil" %>
<%@ page import="com.rp.LogUtil" %>
<%@ page import="com.rp.emp.EmpBean"%>
<%@ page import="com.rp.emp.EmpDto"%>
<%@ page import="com.rp.emp.LoginBean"%>
    
<%
request.setCharacterEncoding("utf-8");
LogUtil.LogRequestPrams(request);

LoginBean bean = new LoginBean();
ArrayList<EmpDto> al = bean.selectLoginInfo(request);

if(al.size() == 1 ) {
	EmpDto dto = al.get(0);
	session.setAttribute("id", dto.getId());
}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>