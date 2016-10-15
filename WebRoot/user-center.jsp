<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="Message.Bean.*" %>
<%@ page import="Message.Biz.*" %>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
  <style  type="text/css">
      #all{height:800px;{border:0px;margin-top:0px;margin-bottom:0px;}
	  #top{height:50px;border:0px;width:100%;}
	  #middle{height:650px;border:0px;left;width:100%}
	  #down{height:100px;border:0px;width:100%;}
  </style>
    <title>用户中心</title>
  </head> 
  <body>
  <%
    String login=(String)session.getAttribute("USER");
    String name=null;
    if(login==null){
                    out.print("<script> alert('您未登陆，请登陆后重试');location='index.jsp';</script>");  
    }
  %>
  <div id="all">
  <div id="top">
  <p>欢迎用户：
   <%
     if(login!=null){   
        name=session.getAttribute("USER").toString();
        out.print(name);
     }
     else{
	   out.print("<script> alert('您未登陆，请登陆后重试');location='index.jsp';</script>");
     }
   %>
   </p>
   <hr/>
   <a  href="user-add-message.jsp">新建短消息</a>
   <hr/>
  </div>
  <div id="middle">
   <%
    Message message=new Message();
    message.setUname(name);
    String pageNumber = request.getParameter("Number"); //显示当前在第几页
	if(pageNumber == null || pageNumber.equals("")){ //如果没有此参数为空
	  	pageNumber = "1"; //缺省显示第一页
	}
	int number = Integer.parseInt(pageNumber); //转成整数类型
	int newsnumber=10; //每页显示的数据条数
	int start = 0; //从第几条开始
	int end = 0; //到第几条结束
	start = (number - 1) * newsnumber+ 1;
	end = number * newsnumber;
	int count = MessageBiz.getMessageCount(); //总条数
	int total = (count - (count%newsnumber))/newsnumber; //总页数
	if(count % newsnumber != 0){ //如不能整除，页数加一
	  	total++;
	}
    List messages=MessageBiz.showMessageList(message,start,end);
    request.setAttribute("messages", messages);
   %>
   <p>短消息：</p>
   <c:forEach var="messages" items="${requestScope.messages}" varStatus="Status">
   <p>   
               发送方： ${messages.uname }
               标题：${messages.msgtitle }
     <c:if test="${messages.state eq 1 }">(未读)</c:if><!判断state=1->          
     <a href="user-read-message.jsp?Id=${messages.msgid }">查看</a>&nbsp;
     <a href="user-delete-message-control.jsp?Id=${messages.msgid }"onclick="javascript:if(confirm('确定要删除此信息吗？')){return true;}return false;">删除</a>
   </p>
   </c:forEach>
   <form name="page" method="post" action="user-center.jsp">                    
   页码: 
     <select name="Number">         
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
  <div id="down">
  <hr/>
    <center>
    <p>COPYRIGHT &copy;&nbsp;&nbsp;2010-2015&nbsp;&nbsp;<a href="index.jsp"><span style="color:#0066FF">新闻</a>&nbsp;&nbsp;ALL RIGHT RESERVED<br/>
            热线123-45-67890&nbsp;&nbsp;Email:1357308624@163.com<br/>
    ICP:&nbsp;豫ICP228271203
	</p>
	</center>
  </div>
  </div>
  </body>
</html>
