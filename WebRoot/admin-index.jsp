<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<title>管理新闻主页</title>
<style type="text/css">
	#all{ width:100%;height:630px; background-color:#FFFFFF;}
	#top{ width:100%; height:100px; background-color:#FFFFCC;float:left;}
	#top1{ width:100%; height:30px; background-color:#FFFFCC; float:left;}
	#left{ width:20%; height:400px; background-color:#FFFFFF;float:left;}
	#middle{ width:80%; height:400px; background-color:#FFFFFF;float:left;}
	#bottom{ width:100%; height:100px; background-color:#FFFFFF;float:left;text-align:center;}
	</style>
</head>

<body>
      <% 
       //session访问控制
        String login=(String) session.getAttribute("ADMINLOGIN");
        if(login==null){
                        request.setAttribute("info", "你无权访问此页面，请登陆后重试");
	                    request.getRequestDispatcher("admin-login.jsp").forward(request, response);
                       }
      %>
<div id="all">
	  <div id="top">
		<p><font style="font-size:12px">&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用新闻管理系统</font>
		</p>		</div>
		<div id="top1">&nbsp;&nbsp;&nbsp;&nbsp;管理员：
	  <%
		//获得cookie
        Cookie cookies[]=request.getCookies();
        for(int i=0;i<cookies.length;i++){
        Cookie ucookies=cookies[i];
        ucookies.setMaxAge(1*60);
        if(ucookies.getName().equals("admname"))
        out.print(ucookies.getValue());
         }                        
	  %>
	  <%
	    String pageNumber = request.getParameter("pageNumber"); //显示当前在第几页
	  	if(pageNumber == null || pageNumber.equals("")){ //如果没有此参数为空
	  	   pageNumber = "1"; //缺省显示第一页
	  	}
	    int number = Integer.parseInt(pageNumber); //转成整数类型
	  	int newsnumber=9; //每页显示的数据条数
	  	int start = 0; //从第几条开始
	  	int end = 0; //到第几条结束
	  	start = (number - 1) * newsnumber+ 1;
	    end = number * newsnumber;
	  	News news = new News();
	  	int count = NewsBiz.getCount(); //总条数
	  	int total = (count - (count%newsnumber))/newsnumber; //总页数
	  	if(count % newsnumber != 0){ //如不能整除，页数加一
	  	   total++;
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
		<div id="middle"> 
		   <%
		   	List nl=new ArrayList();
		    int newsNumber=0;
		   	nl=NewsBiz.showList(start, end);
		   	/*用于遍历（即迭代访问）Collection集合中的元素，Iterator对象也被称为迭代器	
		      boolean hasNext()：如果被迭代的集合还元素没有被遍历，则返回true。
		   	  Object next()：返回集合里下一个元素。*/
		   	Iterator it=nl.iterator();
		   	//循环输出it中的值 直到输出完毕
		    while(it.hasNext()){
		    	               news =(News)it.next();	
		   %>
	  		 <li> 
	  			  <% out.print(news.getNid()+"&nbsp;"+news.getTitle()+"&nbsp;"+news.getAbst());%>
	  			  <a href=admin-edit-news.jsp?newsNumber=<%=news.getNid() %>>修改</a>&nbsp;&nbsp; 
	  			  <a href=admin-deletenews-control.jsp?newsNumber=<%=news.getNid() %>  onclick="javascript:if(confirm('确定要删除此信息吗？')){return true;}return false;">删除</a>
	  		 </li>                  
	  		<%}%> 
	  		<form name="page">                    
                        页码: 
            <a href=admin-index.jsp?pageNumber=<%=1%>>首页</a>                 
            <%int i=1;%>           
            <%for( i = 1;i <= total;i++) {%> 
            <a href=admin-index.jsp?pageNumber=<%=i%>><%=i%></a>    
            <% } %>
            <%if(number!=1){%>
            <a href=admin-index.jsp?pageNumber=<%=number-1%>>上一页</a>
            <% } %>  
            <%if(number!=total){%> 
            <a href=admin-index.jsp?pageNumber=<%=number+1%>>下一页</a>
            <% } %>       
            <a href=admin-index.jsp?pageNumber=<%=total%>>末页</a>
            </form> 
		</div>
		<div id="bottom">
		<hr />
		 <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="#"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br/>
	 ICP:&nbsp;豫ICP228271203</p>
		</div>
        </div>
</body>
</html>