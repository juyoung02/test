<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rp.DBUtil" %>

<%
request.setCharacterEncoding("utf-8");
System.out.println("seq:" + request.getParameter("seq"));

int seq = 0;

seq = Integer.parseInt(request.getParameter("seq"));

Connection conn = DBUtil.getConnection();

int rt;

PreparedStatement pstmt = null;
try {
	StringBuffer sb = new StringBuffer("");
	sb.append("delect from emp            \n");
	sb.append("where seq = ?              \n");
	
	System.out.println(sb.toString());
	
	pstmt = conn.prepareStatement(sb.toString());
	pstmt.setInt( 1, seq);
	
	rt = pstmt.executeUpdate();
	if (rt<0){
		%>
		<script language="javascript">
					alert("저장되었습니다.")
					window.document.location.href="select_list.jsp"
		</script>
        <%
	}
} catch (Exception e){
	System.out.println("error :" + e);
	e.printStackTrace(System.out);
} finally {
	if (pstmt != null) { try { pstmt.close(); } catch  (SQLException e) { e.printStackTrace();}}
    if (conn != null) { try { conn.close(); } catch  (SQLException e) { e.printStackTrace();}}
     
}
%>
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