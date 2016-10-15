<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="newsSystem.Bean.*" %> 
<%@ page import="newsSystem.Biz.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册处理界面</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String[] s=request.getParameterValues("uknown");
	String sex=request.getParameter("sex");
	StringBuilder sb=new StringBuilder("");//将字符串数组转为字符串
	for(int i=0;i<s.length;i++){
	sb.append(s[i]);
	sb.append(";");
	}
	String uknown=sb.toString();
	User user=new User();
	user.setUname(name);
	user.setUpwd(pwd);
	user.setEmail(email);
	user.setUknown(uknown);
	user.setUsex(sex);
	int v=UserBiz.UserRegist(user);
	if(v!=0){
		     out.print("<script>alert('注册成功！！！');location='index.jsp';</script>");
	}
	else{
		out.print("<script>alert('注册失败！！！');location='user-register.jsp';</script>");
	}
 %>
</body>
</html>