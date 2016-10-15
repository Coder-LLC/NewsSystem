<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'user-login-out.jsp' starting page</title>
  </head>
  
  <body>
     <% 
     session.removeAttribute("USER"); 
     session.invalidate(); 
     out.print("<script>alert('即将注销，确定后退出该页面。');window.location.href='index.jsp'</script>");
     Cookie newCookie=new Cookie("username",null); //假如要删除名称为username的Cookie
     newCookie.setMaxAge(0); //立即删除型
     newCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
     response.addCookie(newCookie); //重新写入，将覆盖之前的
   %> 
   <%
   //清除所有cookie
   Cookie[] cookies=request.getCookies();
   for(Cookie cookie: cookies){
   cookie.setMaxAge(0);
   cookie.setPath("/");
   response.addCookie(cookie);
   }
   %>
  </body>
</html>
