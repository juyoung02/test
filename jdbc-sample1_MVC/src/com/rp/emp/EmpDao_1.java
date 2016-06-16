package com.rp.emp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import com.rp.DBUtil;
import com.rp.LogUtil;
import com.rp.db.DataSource;
import com.rp.emp.EmpDto;


public class EmpDao_1 {
	final static Logger logger = Logger.getLogger(DataSource.class);

	
	private static EmpDao_1     dao;
     
	    public static EmpDao_1 getInstance() {
	        if (dao == null) {
	            dao = new EmpDao_1();
	            return dao;
	        } else {
	            return dao;
	        }
	    }
     
public int insertEMP(HttpServletRequest request, Connection conn) {
         
        int rt = 0;
        PreparedStatement pstmt = null;
          
        LogUtil.LogRequestPrams(request);
         
        StringBuffer sb= new StringBuffer("");
         
        sb.append(" insert into emp (                  \n");      
        sb.append("      id                         ,\n");       
        sb.append("      passwd                         ,\n");       
        sb.append("      first                      ,\n");       
        sb.append("      last                       ,\n");       
        sb.append("      age                        \n");       
        sb.append(" )                               \n"); 
        sb.append(" values (?,?,?,?,?)                   \n");
         
        System.out.println("sql=" + sb.toString());
         
        try {
             
            //쿼리실행
            pstmt = conn.prepareStatement(sb.toString());
             
            //파라미터 바인딩
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString( 1, request.getParameter("id"));
            pstmt.setString( 2, request.getParameter("passwd"));
            pstmt.setString( 3, request.getParameter("first"));
            pstmt.setString( 4, request.getParameter("last"));
            pstmt.setString( 5, request.getParameter("age"));
             
             
            //쿼리실행
            rt = pstmt.executeUpdate();
             
             
        } catch (SQLException e){
        	  logger.error("StackTrace Log", e);  //logger에 Stack Trace 기록
            e.printStackTrace();
             
        } finally {
            //관련자원 닫기
            DBUtil.closeConnection(conn,pstmt);
        }
        return rt;

}

public ArrayList<EmpDto> selectEmpList(HttpServletRequest request,
		Connection conn) {
	// TODO Auto-generated method stub
	return null;
}
}