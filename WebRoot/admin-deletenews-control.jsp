<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>删除新闻控制</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("utf-8");
      String id=request.getParameter("newsNumber");
      int nid=Integer.parseInt(id);
      News news=new News();
      news.setNid(nid);
      int t=0;
      t=NewsBiz.deleteNews(news);
      if(t>0){
              out.print("<script>alert('删除新闻成功！！！');location='admin-index.jsp';</script>");
             }
      else{
    	   out.print("<script>alert('删除新闻失败！！！');location='admin-index.jsp';</script>");
          }
    %>
  </body>
</html>
