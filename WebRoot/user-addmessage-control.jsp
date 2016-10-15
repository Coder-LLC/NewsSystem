<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Message.Bean.*" %>
<%@ page import="java.net.*" %>
<%@ page import="Message.Biz.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>短消息控制</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("utf-8");  
      String login=(String)session.getAttribute("USER");
      String uname=null;
      if(login!=null){
    	 uname=session.getAttribute("USER").toString();
      }
      String msgtitle=request.getParameter("msgtitle");
      String msgcontent=request.getParameter("msgcontent");
      int state=1;
      String msgsendto=request.getParameter("msgsendto");
      Message message=new Message();
      message.setUname(uname);
      message.setMsgtitle(msgtitle);
      message.setMsgcontent(msgcontent);
      message.setSendto(msgsendto);
      message.setState(state);
      int v=MessageBiz.addMessage(message);
      if(v!=0){
    	       out.print("<script>alert('消息发送成功！！！');location='user-center.jsp';</script>");
      }
      else{
    	   out.print("<script>alert('消息发送失败！！！');location='user-center.jsp';</script>");
      }
    %>
  </body>
</html>
