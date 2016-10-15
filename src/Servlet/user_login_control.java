package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import newsSystem.Bean.User;
import newsSystem.Biz.UserBiz;

public class user_login_control extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String username1=request.getParameter("username").trim(); 
		String username=URLDecoder.decode(username1,"utf-8");  
		String pwd=request.getParameter("pwd").trim();
		PrintWriter out = response.getWriter();
		boolean bol=false;
		User user=new User();
		user.setUname(username);
		user.setUpwd(pwd);
		ServletContext application=getServletContext();
		HttpSession session=request.getSession();
		bol=UserBiz.UserLogin(user);
		if(bol){  
				session.setAttribute("USER", username);
			    session.setMaxInactiveInterval(5*60);
				Cookie uname=new Cookie("username",URLEncoder.encode(username,"utf-8"));//解决cookie中文报错
				uname.setMaxAge(5*60);
		        response.addCookie(uname);
			    Integer count=(Integer)application.getAttribute("count");
			    if(count==null){ 
			       count=1;
			    }
			    else{
			         count=count+1;
			    }
			    application.setAttribute("count", count);
				out.println(username); 
			    }
		else{
			 //out.print("<script>alert('用户名或密码错误，请检查后重试');location='index.jsp';</script>");
			 out.println(0);
			}	
	   out.flush();
	   out.close();
}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        doGet(request,response);
	    
	}

}
