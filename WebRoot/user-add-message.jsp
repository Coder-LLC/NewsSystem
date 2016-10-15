<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发送短消息</title>
    <script type="text/javascript">
  function checkInfo(){
	  if(document.message.msgtitle.value==""){
		  alert("标题不能为空");
		  return(false);
		  }
	  if(document.message.msgsendto.value==""){
		  alert("接收方不能为空");
		  return(false);
		  }
	  if(document.message.msgcontent.value==""){
		  alert("内容不能为空");
		  return(false);
	      }
  }
  </script>
  </head>
 <body>
   <% 
     String login=(String) session.getAttribute("USER");
     if(login==null){
                     out.print("<script> alert('您未登陆，请登陆后重试');location='index.jsp';</script>");  
     }
   %>
   <p>欢迎用户：
   <% 
     String name=null;
     int state=0;
     if(login!=null){
 	   name=session.getAttribute("USER").toString();
       out.print("欢迎用户："+name+"登陆"); 
     }
   %>
   </p>
  <center>
  <form name="message"  method="post"  action="user-addmessage-control.jsp" onsubmit="return checkInfo()">
  <p>短消息：</p>
  <p>标题：<input type="text" name="msgtitle"size="20" id="title" maxlen /></p>
  <p>接收方：<input type="text" name="msgsendto"size="20" maxlen /></p>
  <p>内容：<textarea type="text" name="msgcontent"rows="5" cols="50" maxlen ></textarea></p>
  <p><input type="submit"name="button"value="提交" />&nbsp;&nbsp;<input type="reset"name="cancel"value="重置"/></p>
  </form>
  </center>
  </body>
</html>
