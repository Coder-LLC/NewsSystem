<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新闻查询结果</title>
     <style type="text/css">
	#all{ width:100%;height:1030px; background-color:#FFFFFF;float:left;}
	#top{ width:100%; height:100px; background-color:#FFFFFF;float:left;}
	#top1{ width:100%; height:30px; background-color:#FFFFFF; float:left;}
	#left{ width:20%; height:800px; background-color:#FFFFFF;float:left;}
	#right{ width:80%; height:800px; background-color:#FFFFFF;float: right;}
	#bottom{ width:100%; height:100px; background-color:#FFFFFF;float:left;text-align:center;}
	</style>
  </head>
  <body>
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
        String newsNumber=request.getParameter("newsNumber");//获取新闻nid
        int id= Integer.parseInt(newsNumber);
        News news=new News();
        news=NewsBiz.getNewsById(id);//使用传过来的nid查询新闻
        request.setAttribute("news", news);
	    %>
	    <%
	    List comment=new ArrayList();
	    comment=CommentBiz.getCommentByNid(id);//使用传过来的nid查询评论
	    request.setAttribute("comment", comment);
	    %>
		</div>
		<div id="left">
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addnews.jsp">添加新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">编辑新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-select-news.jsp">查找新闻</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-addtitle.jsp">添加主题</a></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin-title.jsp">编辑主题</a></p>
		</div>
		<%
		  request.setCharacterEncoding("utf-8");
        %>
		<div id="right">
		<form name="form"  method="post" action="admin-editnews-control.jsp" onsubmit="return checkInfo()">
		<p>新闻编号：<textarea type="text" rows="1" cols="10" maxlen name="nid" readonly>${news.nid}</textarea></p>
		<p>新闻所属主题：
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
	  	  原新闻所属主题：${news.bmon}
		</p>
		<p>标题：<textarea type="text" rows="2" cols="20" maxlen name="title">${news.title}</textarea></p>
		<p>作者：<textarea type="text" rows="1" cols="15" maxlen name="writer">${news.writer}</textarea></p>
		<p>创建时间：${news.ncreatedate}</p>
		<p>摘要：<textarea type="text" rows="2" cols="20" maxlen name="abst">${news.abst}</textarea>
		<p>内容：<textarea type="text" rows="6" cols="60" maxlen name="content">${news.content}</textarea></p>
		<p><input type="submit"name="button"value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"name="cancel"value="重置"/></p>
		</form>
		<p>评论：</p>
		<c:forEach var="comment" items="${requestScope.comment }" varStatus="Status"> 
		<p>评论发布者：${comment.cathor}</p>
		<p>发布时间：${comment.cdate}</p>
		<p>评论内容：${comment.ccontent}
		<p>发布者IP:${comment.cip }</p>
		<p><a href="servlet/admin_editcomment_control?Id=${comment.cid }"onclick="javascript:if(confirm('确定要删除此信息吗？')){return true;}return false;">删除</a></p>
		</c:forEach>
	</div>	
	<div id="bottom">
	<hr/>
	<p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="admin-index.jsp"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线：123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br />
	ICP:&nbsp;豫ICP备228271203号</p>	
	</div>
	</div>
</body>
</html>		 
