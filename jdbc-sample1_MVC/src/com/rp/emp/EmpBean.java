package com.rp.emp;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.rp.DBUtil;

import org.apache.log4j.Logger;


public class EmpBean {
	final static Logger logger = Logger.getLogger(EmpDao.class);
	public ArrayList<EmpDto> selectEmpList(HttpServletRequest request) {
		ArrayList<EmpDto> al = new ArrayList<EmpDto>();
		String search_type = request.getParameter("search_type");
		String search_string = request.getParameter("search_string");

		Connection conn = DBUtil.getConnection();

		//Query작성
		StringBuffer sb= new StringBuffer("");
		sb.append(" SELECT                        \n"); 
		sb.append(" seq                          ,\n"); 
		sb.append(" id                           ,\n");       
		sb.append(" passwd                       ,\n"); 
		sb.append(" age                          ,\n");        
		sb.append(" first                        ,\n");        
		sb.append(" last                          \n");        
		sb.append(" FROM emp                      \n");   
		sb.append(" where   1=1                   \n");

		if ( search_string != null) {
		    if (search_type.equals("id")) {
		        sb.append(" and id = ?                    \n"); 
		    } else if (search_type.equals("first")) {
		        sb.append(" and first = ?                    \n");
		    } else if (search_type.equals("last")) {
		        sb.append(" and last = ?                    \n");
		    } else if (search_type.equals("age")) {
		        sb.append(" and age = ?                    \n");
		    }
		}
		 
		//System.out.println("sql=" + sb.toString());
		//System.out.println("search_string=" + search_string);
		//System.out.println("search_type=" + search_type);
		System.out.println("===================================================================");
		logger.info("sql=" + sb.toString());
	    logger.info("search_string=" + search_string);
	    logger.info("search_type=" + search_type);
		
		ResultSet rs = null;
		
		PreparedStatement pstmt = null;
		
		
		try {
		//쿼리실행
		pstmt = conn.prepareStatement(sb.toString());
		
		if ( search_string != null) {
		    // Parameter 바인딩
		    pstmt.setString( 1, search_string);
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()){ 
			EmpDto dto = new EmpDto();
			dto.setSeq(Integer.parseInt(rs.getString("seq")));
			dto.setId(Integer.parseInt(rs.getString("id")));
			dto.setPasswd(rs.getString("passwd"));
			dto.setFirst(rs.getString("first"));
			dto.setLast(rs.getString("last"));
			dto.setAge(Integer.parseInt(rs.getString("age")));
			al.add(dto);
		}
			
		} catch (Exception e) {
			System.out.println("error : " + e);
		    e.printStackTrace(System.out);
		} finally {
			DBUtil.closeConnection(conn, pstmt);
		}
		
		return al;
	}
}
