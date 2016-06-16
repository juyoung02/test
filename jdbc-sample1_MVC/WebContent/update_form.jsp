<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.rp.DBUtil" %>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

StringBuffer sb = new StringBuffer("");
sb.append("SELECT                 \n");
sb.append("id                    ,\n");
sb.append("passwd                ,\n");
sb.append("first                 ,\n");
sb.append("last                  ,\n");
sb.append("age                   ,\n");
sb.append("Form emp               \n");
sb.append("where id = ?           \n");

Connection conn = DBUtil.getConnection();

ResultSet rs = null;

PreparedStatement pstmt = null;
try {
	pstmt = conn.prepareStatement(sb.toString());
	
	pstmt.setString( 1, id);
	rs = pstmt.executeQuery();
	
	rs.first();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="new_form" method="post" action="update_ctl.jsp">
<table border="1" cellspacing="0" width="500">
  <tr>
    <th width="10%">구분</th><th width="25%">입력값</th>
  </tr>
<tr>
<td>ID</td>   
<td><input name="id"></td>
</tr>
<tr>
<td>Passwd</td>   
<td><input name="passwd"></td>
</tr>
<tr>
<td>First Name</td> 
<td><input name="first"></td>
</tr>
<tr>
<td>Last Name</td>
<td><input name="last"></td>
</tr>
<tr>
<td>Age</td>   
<td><input name="age"></td></tr>
<td colspan="2">
<input type="submit" value="제출">
</td>
</table>
</form>
</body>
</html>
<%
} catch (SQLException e) {
	e.printStackTrace(System.out);
} finally {
	DBUtil.closeConnection(conn, pstmt);
}
%>