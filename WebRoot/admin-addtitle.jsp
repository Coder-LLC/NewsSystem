<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加主题</title>
<style type="text/css">
	#all{ width:100%;height:500px; background-color:#FFFFFF;float:left;}
	#top{ width:100%; height:100px; background-color:#FFFFCC;float:left;}
	#top1{ width:100%; height:30px; background-color:#FFFFCC; float:left;}
	#left{ width:20%; height:300px; background-color:#FFFFFF;float:left;}
	#right{ width:80%; height:300px; background-color:#FFFFFF;float: right;}
	#bottom{ width:100%; height:100px; background-color:#FFFFFF;float:left;text-align:center;}
	</style>
	<script type="text/javascript">
	 function check(){
		 if(document.from1.titlename.value==""){
			 alert("主题名称不能为空");
			 return false;
		 }
	 }
	</script>
</head>

<body>
       <% /*request.setCharacterEncoding("UTF-8");
          String message=(String)request.getAttribute("message"); 
          if(message!=null&&! message.equals(""))
	           out.println(message);*/
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
	      for(int i=0;i<cookies.length;i++){
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
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#admin-select-news.jsp">查找新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addtitle.jsp">添加主题</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-title.jsp">编辑主题</a></p>
		</div>
		<div>
		<p>添加主题：</p>
		<br/>
		<form name="from1" method="post" action="admin-addtitle-control.jsp" onsubmit="return check()">
		<p>主题名称&nbsp;&nbsp;<input type="text" name="titlename" size="20"  /></p>
		<br/>
		<p><input type="submit"name="button"value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"name="cancel"  value="重置"/></p>
		</form>
		</div>
			<div id="bottom">
		<hr/>
		 <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="admin-index.jsp"><span style="color:#0066FF">新闻</a></span>&nbsp;&nbsp;ALL RIGHT RESERVED<br />
            热线：123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br />
	   ICP:&nbsp;豫ICP备228271203号</p>	
	</div>
<body>
</body>
</html>