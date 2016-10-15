<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'uesr-addcomment-control.jsp' starting page</title>
  </head>
  <body>
    <% 
      request.setCharacterEncoding("UTF-8");
      String name=null; 
      String login=(String)session.getAttribute("USER"); 
      if(login!=null){
    	 name=session.getAttribute("USER").toString();  
         String id=request.getParameter("Id");
         int cnid=Integer.parseInt(id);
         String content=request.getParameter("content");
         Comment comment=new Comment();
         comment.setCnid(cnid);
         comment.setCcontent(content);
         comment.setCathor(name);
         int v=CommentBiz.addComment(comment);
         if(v!=0){
    	   out.print("<script>alert('评论发送成功！！！');location='index.jsp';</script>");
         }
         else{
    	   out.print("<script>alert('评论发送失败！！！');location='index.jsp';</script>");
         }
      }
      else{
        out.print("<script>alert('登陆超时，请重新登陆！！！');location='index.jsp';</script>");  
      }
    %>
  </body>
</html>
