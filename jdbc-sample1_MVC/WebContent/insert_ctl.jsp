<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rp.DBUtil" %>

<%
System.out.println("id:" + request.getParameter("id"));
System.out.println("passwd:" + request.getParameter("passwd"));
System.out.println("first:" + request.getParameter("first"));
System.out.println("last:" + request.getParameter("last"));
System.out.println("age:" + request.getParameter("age"));

out.println("id:" + request.getParameter("id"));
out.println("first:" + request.getParameter("first"));
out.println("passwd:" + request.getParameter("passwd"));
out.println("last:" + request.getParameter("last"));
out.println("age:" + request.getParameter("age"));

int id = 0;
String passwd = "";
int age = 0;
String first = "";
String last = "";

id = Integer.parseInt(request.getParameter("id"));
age = Integer.parseInt(request.getParameter("age"));
first = request.getParameter("first");
last = request.getParameter("last");


first = new String(first.getBytes("iso-8859-1"), "utf-8");
last = new String(last.getBytes("iso-8859-1"), "utf-8");
System.out.println("first:" + first);
System.out.println("last:" + last);
 
Connection conn = DBUtil.getConnection();

//String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
//String DB_URL = "jdbc:mysql://192.168.101.20/jspdb";

//  Database credentials
//String USER = "test";
//String PASS = "1111";

//Class.forName(JDBC_DRIVER);

//DB연결
//Connection conn = null;

//System.out.println("Connecting to database...");
//conn = DriverManager.getConnection(DB_URL,USER,PASS);


//입력건수
int rt;

//PreparedStatement 선언
PreparedStatement pstmt = null;

try {
	
//Query작성
StringBuffer sb= new StringBuffer("");
sb.append(" insert into emp (               \n"); 
sb.append(" id                             ,\n");    
sb.append(" passwd                         ,\n");  
sb.append(" first                          ,\n");        
sb.append(" last                           ,\n");        
sb.append(" age                             \n");        
sb.append(" )                               \n");   
sb.append(" values (?,?,?,?,?)              \n");
//sb.append(" values (" + id +"','" + first +"','" + last +"','"+ age +")                    \n");
System.out.println(sb.toString());

//파라미터 바인딩
pstmt = conn.prepareStatement(sb.toString());
pstmt.setInt( 1, id);
pstmt.setString( 2, passwd);
pstmt.setString( 3, first);
pstmt.setString( 4, last);
pstmt.setInt( 5, age);
 
//쿼리실행
rt = pstmt.executeUpdate();
%>
<script language="javascript">
	alert("저장되었습니다.");
	window.document.location.hrdf="select_list.jsp";
</script>
<%
//커밋
//conn.commit();

}catch (Exception e) {
	//에러인 경우 Rollback
	//conn.rollback();
	//System.out.println("error : " + e);
    //e.printStackTrace(System.out);
	e.printStackTrace(System.out);
} finally {
	//관련자원 닫기
    //if (pstmt != null) { try { pstmt.close(); } catch  (SQLException e) { e.printStackTrace();}}
    //if (conn != null) { try { conn.close(); } catch  (SQLException e) { e.printStackTrace();}}
	DBUtil.closeConnection(conn, pstmt);
}

%>