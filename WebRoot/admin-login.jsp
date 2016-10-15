<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <title>管理员登陆页面</title>
 <script type="text/javascript">
 function check(){
	 if(document.loginForm.adminname.value==""){
		 alert("管理员名不能为空");
		 return false;
	 }
	 if(document.loginForm.pwd.value==""){
		 alert("密码不能为空");
		 return false;
     }
 }
 </script>
 </head>
  <body>
  <p>
<% 
   request.setCharacterEncoding("utf-8"); 
   String info=(String)request.getAttribute("info"); 
   if(info!=null&&! info.equals(""))out.println(info);
%>
   <center>
   <form name="loginForm" method="post" action="admin-login-control.jsp" onsubmit="return check()"> 
        <p> 管理员名：<input type="text" name="adminname"></p>
        <p> 密码：  <input type="password" name="pwd"></p>
         <input type="submit" value="登陆">
   </form> 
   </center>
  </body>
</html>
