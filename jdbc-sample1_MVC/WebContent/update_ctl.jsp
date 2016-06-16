<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rp.DBUtil" %>

<%
request.setCharacterEncoding("utf-8");
System.out.println("seq:" + request.getParameter("seq"));

int seq = 0;
int age = 0;
String first = "";
String last = "";

seq = Integer.parseInt(request.getParameter("seq"));

Connection conn = DBUtil.getConnection();

int rt;

PreparedStatement pstmt = null;
try {
	StringBuffer sb = new StringBuffer("");
	sb.append("update emp         \n");
	sb.append("set                \n");
	sb.append("first = ?             ,\n");
	sb.append("last  = ?            ,\n");
	sb.append("age  = ?             ,\n");
	sb.append("where seq  = ?            \n");
	
	System.out.println(sb.toString());
	
	pstmt = conn.prepareStatement(sb.toString());
	pstmt.setString( 1, first);
	pstmt.setString( 2, last);
	pstmt.setInt( 3, age);
	pstmt.setInt( 4, seq);
	
	rt = pstmt.executeUpdate();
	if(rt > 0){
		%>
		<script language="javascript">
					alert("저장되었습니다.");
					window.document.location.href="select_list.jsp";
		</script>
		<%
	}
		
} catch (Exception e) {
	System.out.println("error : " + e);
	e.printStackTrace(System.out);
} finally {
	DBUtil.closeConnection(conn,pstmt);
}
%>
