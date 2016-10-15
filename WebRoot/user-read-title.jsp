<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <style  type="text/css">
      #all{height:800px;{border:0px;margin-top:0px;margin-bottom:0px;}
	  #top{height:50px;border:0px;width:100%;}
	  #middle{height:650px;border:0px;left;width:100%}
	  #down{height:100px;border:0px;width:100%;}
  </style>
    <title>新闻分类阅读</title>
  </head>
  <body>
    <div id="all">
    <div id="top">
     <%
     String login=(String)session.getAttribute("USER");
     String name=null;
     if(login!=null){
   	    name=session.getAttribute("USER").toString();
        out.print("欢迎用户："+name+"登陆");   
     }
	  %>	
    </div>
    <div id="middle">
    <%
      int titleid=Integer.parseInt(request.getParameter("titleid"));
      News news=new News();
      news.setBmon(titleid);
      List li=NewsBiz.showNewsByTitle(news);
      request.setAttribute("li", li);
    %>
    <c:forEach var="li" items="${requestScope.li }" varStatus="status">
    <p><a href="user-read-news.jsp?Id=${li.nid }">${li.title}&nbsp;${li.abst }&nbsp;${li.writer }</a></p>
    </c:forEach>    
    </div>
    <div id="down">
     <hr/>
    <center>
    <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="index.jsp"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br/>
    ICP:&nbsp;豫ICP228271203
	</p>
	</center>
    </div>
    </div>
  </body>
</html>
