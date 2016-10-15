<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新闻</title>
   <style type="text/css">
	#all{ width:100%;height:700px; background-color:#FFFFFF;float:left;}
	#top{ width:100%; height:100px; background-color:#FFFFFF;float:left;}
	#top1{ width:100%; height:30px; background-color:#FFFFFF; float:left;}
	#left{ width:20%; height:500px; background-color:#FFFFFF;float:left;}
	#right{ width:80%; height:500px; background-color:#FFFFFF;float: right;}
	#bottom{ width:100%; height:100px; background-color:#FFFFFF;float:left;text-align:center;}
	</style>
<script type="text/javascript">
  function checkInfo(){
	  if(document.check.title.value==""){
		  alert("主题不能为空");
		  return(false);
		  }
	  if(document.check.writer.value==""){
		  alert("作者不能为空");
		  return(false);
		  }
	  if(document.check.abst.value==""){
		  alert("摘要不能为空");
		  return(false);
	      }
	  if(document.check.content.value==""){
		  alert("内容不能为空");
		  return(false);
	      }
	  if(document.check.file.value==""){
		  alert("图片不能为空");
		  return(false);
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
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-title.jsp">编辑主题</a></p>
		</div>
		<div id="right">
		<P>添加新闻：</P>
		<form name="check"  method="post" enctype="multipart/form-data" action="admin-addnews-control.jsp" onsubmit="return checkInfo()">
		<p>主题：
		  <select name="bmon">
		 <% 
		   List nl=new ArrayList();
		   nl=NewsBiz.chooseTopic(); 
		   request.setAttribute("nl", nl);
         %>
           <c:forEach var="nl" items="${requestScope.nl }" varStatus="Status"> 
           <option>
           <c:out value="${nl.tid }"></c:out>
           <c:out value="-"></c:out>
           <c:out value="${nl.tName }"></c:out>
           </option>
           </c:forEach>
	  	   </select>
		</p>
		<p>标题：<input type="text" name="title"size="20" id="title" maxlen /></p>
		<p>作者：<input type="text" name="writer"size="20" maxlen /></p>
		<p>摘要：<input type="text" name="abst"size="30" maxlen></p>
		<p>内容：<textarea type="text" name="content"rows="6" cols="60" maxlen ></textarea>></p>
		<p>上传图片：<input type="file"name="file" multiple="multiple" /></p>
		   (注意：只允许上传jpg,jpeg,bmp文件，单文件应小于3m，图片总大小应小于10m，若要上传多个文件，按住ctrl键，选择要上次的文件) 
		<p><input type="submit"name="button"value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"name="cancel"value="重置"/></p>
		</form>
		</div>
		<div id="bottom">
		<hr/>
		 <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="admin-index.jsp"><span style="color:#0066FF">新闻</a></span>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线：123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br />
	 ICP:&nbsp;豫ICP备228271203号</p>	
	</div>
</body>
</html>		 