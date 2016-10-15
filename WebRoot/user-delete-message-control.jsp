<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Message.Bean.*" %>
<%@ page import="Message.Biz.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>删除短消息控制</title>
  </head>
  <body>
    <%
      String id=request.getParameter("Id");
      int msgid=Integer.parseInt(id);
      Message message=new Message();
      message.setMsgid(msgid);
      int v=MessageBiz.deleteMesage(message);
      if(v>0){
          out.print("<script>alert('删除短消息成功！！！');location='user-center.jsp';</script>");
      }
      else{
	       out.print("<script>alert('删除短消息失败！！！');location='user-center.jsp';</script>");
      }
    %>
  </body>
</html>
