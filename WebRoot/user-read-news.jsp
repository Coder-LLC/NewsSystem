<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新闻阅读</title>
     <style  type="text/css">
      #all{height:800px;{border:0px;margin-top:0px;margin-bottom:0px;}
	  #top{height:50px;border:0px;width:100%;}
	  #middle{height:650px;border:0px;left;width:100%}
	  #down{height:100px;border:0px;width:100%;}
  </style>
   <script type="text/javascript">
    function check(){
   	 if(document.Form.content.value==""){
   		 alert("评论不能为空");
   		 return false;
   	 }
    }
    </script>
  </head>
  <body>
    <div id="all">
    <div id="top">       
    <%
      String login=(String)session.getAttribute("USER");
      String name=null;
      int state=0;
      if(login!=null){
    	 name=session.getAttribute("USER").toString();
         out.print("欢迎用户："+name+"登陆"); 
         state=1;
      }
      request.setAttribute("state",state); 
    %>        
    <hr/>         
    </div>
    <div id="middle">
    <%
      String id=request.getParameter("Id");
      int nid=Integer.parseInt(id);
      News news=new News();
      news=NewsBiz.getNewsById(nid);
      request.setAttribute("news", news);
    %>
    <p>标题：${news.title }</p>
    <p>作者：${news.writer }</p>
    <p>内容：${news.content }</p>
    <p>添加时间：${news.ncreatedate }</p>
    <c:if test="${state eq 1 }">   
    <form name="Form" method="post" action="uesr-addcomment-control.jsp?Id=${news.nid }" onSubmit="return check();">
    <p>评论：<textarea type="text" name="content"rows="6" cols="60" maxlen ></textarea></p>
    <center><p><input type="submit"name="button"value="提交" /></p></center>
    </form>
    </c:if>
    <c:if test="${state eq 0 }">
    <p>如要发表评论：请先<a href="index.jsp">登录</a></p>
    </c:if>
    </div>
    <div id="down">
     <hr/>
    <center>
    <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="index.jsp"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT      RESERVED<br/>
     热线123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br/>
    ICP:&nbsp;豫ICP228271203
	</p>
	</center>
    </div>
    </div>
  </body>
</html>
