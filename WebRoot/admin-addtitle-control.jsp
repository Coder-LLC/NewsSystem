<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<html>
  <head>   
    <title>添加主题控制页面</title>
  </head>
  <body>
   <%
   request.setCharacterEncoding("utf-8");
   String tName=request.getParameter("titlename");
   /*//if (tName==null || tName.equals("")){
		 request.setAttribute("message","主题不能为空");
		  request.getRequestDispatcher("addtitle.jsp")
		 .forward(request, response);
		  return;
                                        }*/
   int t=0;
   Title title=new Title();
   title.settName(tName);
    //将addt的返回值回传
   t=NewsBiz.addTitle(title);
   if(t>0){
	      // out.println("添加主题成功");
	       //request.setAttribute("message","添加主题成功");
			//  request.getRequestDispatcher("addtitle.jsp")
			 //.forward(request, response);
	       out.print("<script>alert('添加主题成功！！！');location='admin-addtitle.jsp';</script>");
          }
   else{
	   out.print("<script>alert('添加主题失败！！！');location='admin-addtitle.jsp';</script>");
   }
   %>
  </body>
</html>
