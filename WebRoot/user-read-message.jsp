<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Message.Bean.*" %>
<%@ page import="Message.Biz.*" %>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>短消息阅读</title>  
    <style  type="text/css">
      #all{height:800px;{border:0px;margin-top:0px;margin-bottom:0px;}
	  #top{height:50px;border:0px;width:100%;}
	  #middle{height:650px;border:0px;left;width:100%}
	  #down{height:100px;border:0px;width:100%;}
  </style>
  </head>
  <body>
   <%
    String login=(String) session.getAttribute("USER");
    if(login==null){
                    out.print("<script> alert('您未登陆，请登陆后重试');location='index.jsp';</script>");  
    }
   %>
   <div id="all">
   <div id="top">
   <p>欢迎用户：
   <% 
     /*String name=session.getAttribute("USER").toString();
     Cookie cookies[]=request.getCookies();
     Cookie ucookies=null;
     for(int i=0;i<cookies.length;i++){
     ucookies=cookies[i];
     ucookies.setMaxAge(5*60);
     if(ucookies.getName().equals("username"))
    	 name=URLDecoder.decode(ucookies.getValue(),"utf-8");//解决cookie中文报错
     }
         out.print(name);*/
    String name=null;     
    if(login!=null){   
       name=session.getAttribute("USER").toString();
       out.print(name);
    }   
   %>
   </p>
   <hr/>
   </div>
   <div id="middle">
    <%
      String mid=request.getParameter("Id");
      int id= Integer.parseInt(mid);
      Message message=new Message();
      message.setMsgid(id);
      List li=MessageBiz.getMessageById(message);
      request.setAttribute("li", li);
    %>
    <c:forEach var="li" items="${requestScope.li }" varStatus="Status">
    <p>发送方：${li.uname }</p> 
    <p>标题：${li.msgtitle }</p> 
    <p>内容：${li.msgcontent }</p>
    <p>发送时间：${li.msg_creat_date }</p>
    </c:forEach>
    <%
      MessageBiz.changeState(message);//将未读改为已读
    %>
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
