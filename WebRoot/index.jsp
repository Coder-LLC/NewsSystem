<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <style  type="text/css">
   #big{height:1050px;border:0px;margin-top:0px;margin-bottom:0px;}
   #head{height:25px;border:0px;float:left;width:100%;}
   #top{height:50px;border:0px;float:left;width:100%;}
   #left{height:820px;border:0px;float:left;width:15%;}
   #left-top{height:410px;}
   #left-down{height:410px;}
   #title-list{color:#F00;}
   #news{color:#30F;}
   #midd{height:20px;border:0px;float:left;width:85%;}
   #mid{height:800px;border:0px;width:60%;float:left;}
   #topic{height:80px;width:100%;float:left;border:0px;}   
   #right{height:800px;border:0px;width:25%;float:left;}
   #down{height:75px;border:0px;width:100%;float:left;margin:0 auto;}
   #foot{height:80px;border:0px;width:100%;float:left;}
   </style>
    <script type="text/javascript" charset="UTF-8">
    var XMLHttp;
    function createXMLRequest(){  //创建XMLHttpRequest对象
      if(window.XMLHttpRequest){
         XMLHttp=new XMLHttpRequest();
      }
      else if(window.ActiveObject){
         XMLHttp=new ActiveObject("Microsoft.XMLHTTP");
      }
    }
    function check(){
      if (document.getElementById("username").value==""){
         alert("请输入用户名");
         return false;
      }
      else if(document.getElementById("pwd").value==""){
         alert("请输入密码");
         return false;
      }
     /* var flag =0;
      var choose = document.getElementsById("role");
      for (var i = 0; i < choose.length; i++) {
          if (choose[i].checked == true) {
        	  flag=choose[i].value;
          }
      }
      if(flag==0){
        alert("请选择登陆角色");
        return false;
      }
      else if(flag=="2"){
    	  var username=document.getElementById("username").value;
          var password=document.getElementById("pwd").value;
          username = encodeURI(username);
          username = encodeURI(username);
          location.href="admin-login-control.jsp?username="username+"password="password;
      }*/
      else{
        doAjax();
      }
    }
    function doAjax(){
      createXMLRequest();
      var username=document.getElementById("username").value;
      var password=document.getElementById("pwd").value;
      username = encodeURI(username);
      username = encodeURI(username);
      if(XMLHttp!=null){
        XMLHttp.open("POST","servlet/user_login_control?username="+username+"&pwd="+password, true);
        XMLHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        XMLHttp.onreadystatechange=processRequest;
        XMLHttp.send(null);
      }
      else{
        alert("不能创建XMLHttpRequest对象实例");
      }
    }
    String.prototype.trim=function(){
      var m=this.match(/^\s*(\S+(\s+\S)*)\s*$/);
      return (m==null) ? "" : m[1];
    } 
    function processRequest(){  //设置回调函数
      if(XMLHttp.readyState==4){
        if(XMLHttp.status==200){
          var sobj=document.getElementById("login");
          var str=XMLHttp.responseText;
          if(str!=0){  
            sobj.innerHTML="欢迎"+str+"登陆";  
          }
          else{
        	  alert("用户名或密码错误");
          }
        }
      }
    }

 </script>
<title>新闻主页</title>
</head>
<body>
 <% 
   News news=new News();
   Title title=new Title();
   List li=new ArrayList();
   li=NewsBiz.titleList();
   request.setAttribute("li", li);
 %>  
 <%
	String pageNumber = request.getParameter("pageNumber"); //显示当前在第几页
	if(pageNumber == null || pageNumber.equals("")){ //如果没有此参数为空
	  	pageNumber = "1"; //缺省显示第一页
	}
	int number = Integer.parseInt(pageNumber); //转成整数类型
	int newsnumber=7; //每页显示的数据条数
	int start = 0; //从第几条开始
	int end = 0; //到第几条结束
	start = (number - 1) * newsnumber+ 1;
	end = number * newsnumber;
	News ne = new News();
	int count = NewsBiz.getCount(); //总条数
	int total = (count - (count%newsnumber))/newsnumber; //总页数
	if(count % newsnumber != 0){ //如不能整除，页数加一
	  	total++;
	}
	List nl=new ArrayList();
	int newsNumber=0;
	nl=NewsBiz.showList(start, end);
	request.setAttribute("nl", nl);
%>
<div id="big">
<div id="head"> 
  <p id="login"> 
  <c:set var="isLogin" value="${not empty sessionScope.USER }"/>
  <c:if test="${not isLogin }">
         用户名：<input type="text" id="username">
         密码：  <input type="password" id="pwd">  
         <input type="button" value="登陆" onclick="check()"/>   
  </c:if>
  <c:if test="${isLogin }">
         欢迎用户：${sessionScope.USER}登陆
   <a href="user-login-out.jsp">注销当前用户</a>
  </c:if>	  
  </p> 	     
</div>
<div id="top">
  <p>
     <a href=user-center.jsp>个人中心</a>
 </p>
</div>
<div id="left">
<div id="left-top">
<font id="title-list"><h3>国内新闻</h3></font>
  <%
    news.setBmon(1);
    List l=NewsBiz.showNewsByFrame(news);
    request.setAttribute("l", l);  
  %>
    <c:forEach var="l" items="${requestScope.l }" varStatus="status">
    <p><a href="user-read-news.jsp?Id=${l.nid }">${l.title}</a></p>
    </c:forEach>
</div>
<div id="left-down">
<font id="title-list"><h3>国际新闻</h3></font>
  <%
    news.setBmon(2);
    List lis=NewsBiz.showNewsByFrame(news);
    request.setAttribute("lis", lis);  
  %>
    <c:forEach var="lis" items="${requestScope.lis }" varStatus="status">
    <p><a href="user-read-news.jsp?Id=${lis.nid }">${lis.title}</a></p>
    </c:forEach>
</div>
</div>
<div id="midd">
<font id="news"><strong><h3>新闻中心</h3></strong></font>
</div>
<div id="mid">
 <div id="topic">
 <p>
 <c:forEach var="li" items="${requestScope.li }" varStatus="status">
  <a href="user-read-title.jsp?titleid=${li.tid }">${li.tName}</a>
</c:forEach>
</p>
 </div>
  <c:forEach var="nl" items="${requestScope.nl }" varStatus="status">
  <p>${nl.title}&nbsp;${nl.writer}&nbsp;${nl.ncreatedate}&nbsp;<a href="user-read-news.jsp?Id=${nl.nid }">查看</a></p>
  </c:forEach>
<form name="page" method="post" action="index.jsp">                    
  页码: 
     <select name="pageNumber">         
     <%int i=1;           
     for( i = 1;i <= total;i++) {%>
     <option> 
     <%=i%> 
     </option>  
     <% } %>
     </select> 
     <input type="submit"name="button"value="跳转" />      
</form>    
</div>
<div id="right">
</div>
<div id="down">
    <hr/>
    <center>
    <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="index.jsp"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br/>
    ICP:&nbsp;豫ICP228271203
	</p>
	</center>
</div>
<div id="foot">
</div>
</div>
</body>
</html>