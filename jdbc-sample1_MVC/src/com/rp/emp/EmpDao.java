package com.rp.emp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import com.rp.DBUtil;
import com.rp.db.DataSource;
import com.rp.emp.EmpDto;
public class EmpDao {
    final static Logger logger = Logger.getLogger(EmpDao.class);
    private static EmpDao     dao;
     
    public static EmpDao getInstance() {
        if (dao == null) {
            dao = new EmpDao();
            return dao;
        } else {
            return dao;
        }
    }
    public ArrayList<EmpDto> selectEmpList(HttpServletRequest request, Connection conn) {
         
        ResultSet rs = null;
        PreparedStatement pstmt = null;
         
        String search_type = request.getParameter("search_type");
        String search_string = request.getParameter("search_string");
        ArrayList<EmpDto> al = new ArrayList<EmpDto>();
         
        StringBuffer sb= new StringBuffer("");
         
        sb.append(" SELECT                          \n");      
        sb.append("      seq                         ,\n");       
        sb.append("      id                         ,\n");       
        sb.append("      passwd                         ,\n");       
        sb.append("      first                      ,\n");       
        sb.append("      last                       ,\n");       
        sb.append("      age                        \n");       
        sb.append(" FROM emp                        \n"); 
        sb.append(" where      1=1                  \n");
         
        if ( !search_type.equals("all")) {
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
         
        System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
        
        logger.info("sql=" + sb.toString());
        logger.info("search_string=" + search_string);
        logger.info("search_type=" + search_type);
         
         
        try {
             
            //쿼리실행
            pstmt = conn.prepareStatement(sb.toString());
             
            if ( search_string != null) {
                // Parameter 바인딩
                pstmt.setString( 1, search_string);
            }
            rs = pstmt.executeQuery();
             
            while (rs.next()){
                EmpDto dto = new EmpDto();
                 
                dto.setSeq(rs.getInt("seq"));
                dto.setId(rs.getInt("id"));
                dto.setPasswd(rs.getString("passwd"));
                dto.setFirst(rs.getString("first"));
                dto.setLast(rs.getString("last"));
                dto.setAge(rs.getInt("age"));
                 
                // Add to ArrayList
                al.add(dto);
            }
             
             
        } catch (SQLException e){
            logger.error("StackTrace", e);
            e.printStackTrace();
             
        } finally {
            //관련자원 닫기
            DBUtil.closeConnection(conn, pstmt);
        }
        return al;
    }
     
}