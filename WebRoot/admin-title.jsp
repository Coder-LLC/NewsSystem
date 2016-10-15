<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加主题</title>
<style type="text/css">
	#all{ width:100%;height:630px; background-color:#FFFFFF;}
	#top{ width:100%; height:100px; background-color:#FFFFCC;float:left;}
	#top1{ width:100%; height:30px; background-color:#FFFFCC; float:left;}
	#left{ width:20%; height:400px; background-color:#FFFFFF;float:left;}
	#middle{ width:80%; height:400px; background-color:#FFFFFF;float:left;}
	#bottom{ width:100%; height:100px; background-color:#FFFFFF;float:left;text-align:center;}
	</style>
</head>

<body>
       <% request.setCharacterEncoding("UTF-8");
          String message=(String)request.getAttribute("message"); 
          if(message!=null&&! message.equals(""))
	           out.println(message);
       %>
      <% 
        String login=(String) session.getAttribute("ADMINLOGIN");
        if(login==null){
                        request.setAttribute("info", "你无权访问此页面，请登陆后重试");
	                    request.getRequestDispatcher("admin-login.jsp").forward(request, response);
	                    }   
      %>
	<div id="all">
	  <div id="top">
		<p><font style="font-size:12px">&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用新闻管理系统！</font>
		</p>		</div>
		<div id="top1">&nbsp;&nbsp;&nbsp;&nbsp;管理员：
		<% 
	           Cookie cookies[]=request.getCookies();
	           for(int i=0;i<cookies.length;i++)
	            {
	           Cookie ucookies=cookies[i];
	           ucookies.setMaxAge(1*60);
	           if(ucookies.getName().equals("admname"))
	           out.print(ucookies.getValue());
	            }                        
		%>
		</div>
		<div id="left">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addnews.jsp">添加新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">编辑新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-select-news.jsp">查找新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addtitle.jsp">添加主题</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">编辑主题</a></p>
		</div>
		<div id="middle">
		 <%
		   List nl=new ArrayList();
		   nl=NewsBiz.titleList();	
           request.setAttribute("list", nl);
	  	 %> 
	  	 <c:forEach var="nl" items="${requestScope.list }" varStatus="status">
         <p><c:out value="${nl.tid }-"></c:out><c:out value="-${nl.tName}"></c:out> 
         <a href="#">修改</a>&nbsp;&nbsp;<a href="#">删除</a></p>
         </c:forEach>
		  </div>
			<div id="bottom">
		<hr />
		 <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="admin-index.jsp"><span style="color:#0066FF">新闻</a></span>&nbsp;&nbsp;ALL RIGHT RESERVED<br />
            热线：123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br />
	   ICP:&nbsp;豫ICP备228271203号</p>	
	</div>
	</div>
</body>
</html>