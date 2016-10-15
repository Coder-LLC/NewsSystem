package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsSystem.Bean.Comment;
import newsSystem.Biz.CommentBiz;

public class admin_editcomment_control extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int cid=Integer.parseInt(request.getParameter("Id"));
        Comment comment=new Comment();
        comment.setCid(cid);
        int v=0;
        v=CommentBiz.deleteComment(comment);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(v!=0){
		   out.println("<script>alert('删除评论成功！！！');location='http://localhost:8080/NewsSystem/admin-index.jsp';</script>");
		}
		else{
			out.println("<script>alert('删除评论失败！！！');location='http://localhost:8080/NewsSystem/admin-index.jsp';</script>");
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       doGet(request,response);	
	}

}
