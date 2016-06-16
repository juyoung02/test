package com.rp.emp;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rp.DBUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class EmpController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    final Logger logger = LoggerFactory.getLogger(EmpController.class);
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
         
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
         
        response.setContentType("text/html"); 
        //response.getWriter().append("Served at: ").append(request.getContextPath());
         
        //Operation Type
        String OperationType = request.getParameter("OperationType");
        logger.info("OperationType: {}", OperationType);
         
        if (OperationType == null) {
            EmpSvc svc = new EmpSvc();
            request.setAttribute("list",(ArrayList<EmpDto>)svc.getEmpList(request));
            RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/select_list.jsp");
             
            rd.forward(request, response);
        } else if (OperationType.equals("insert")) {
        	
        }
   
    }  
   }