<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.rp.DBUtil" %>
<%@ page import="com.rp.LogUtil" %>
<%@ page import="com.rp.emp.EmpBean"%>
<%@ page import="com.rp.emp.EmpDto"%>


<%
request.setCharacterEncoding("utf-8");

String search_type = request.getParameter("search_type");
String search_string = request.getParameter("search_string");

//System.out.println("search_string=" + search_string);
//System.out.println("search_type=" + search_type);

EmpBean bean = new EmpBean();
ArrayList<EmpDto> al = bean.selectEmpList(request);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
	function search_data(){
		var frn=document.search_form;
		frm.submit();
		}
</script>
</head>
<body>


<form name="search_form" method="post" action="select_detail.jsp">
	<select name="search_type">
		<option value="id">ID</option>
		<option value="first">이름</option>
		<option value="last">성</option>
		<option value="age">나이</option>
	</select>
	<input type="text" name="search_string" value="<%=search_string%>">
	<input type="button" value="조회" onClick="search_dadta();">
</form>
사원목록
<table border="1" cellspacing="0" width="500">
<tr>
    <th width="10%">ID</th><th width="25%">First</th><th width="40%">last</th><th width="25%">age</th>
</tr>
<%
for (int i=0; i < al.size(); i++) {
	EmpDto dto = al.get(i);
	%>
<tr>
		<td><a href="select_detail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getId()%></a></td>
		<td><%=dto.getFirst()%></td>
		<td><%=dto.getLast()%></td>
		<td><%=dto.getAge()%></td>
		</tr>
	<%
	}
   %>
   
<tr>
<th width ="10%" colspan="4"><input type="button" value="New" onclick="javascript:window.document.location.href='insert_form.jsp'"></th>
</tr>

</table>
</body>
</html>
