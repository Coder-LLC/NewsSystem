<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>编辑新闻控制</title>
  </head>
  <body>
       <% 
          request.setCharacterEncoding("utf-8");
          String id=request.getParameter("nid");
          int nid=Integer.parseInt(id);
          String str=request.getParameter("bmon");//获得新闻所属的主题编号
          String st=str.replaceAll("\\s*", "");//去除空格
          if(st.equals("1-国内")){
        	  st="1";
          }
          else if(st.equals("2-国际")){
        	  st="2";
          }
          else if(st.equals("3-科技")){
        	  st="3";
          }
          else if(st.equals("4-军事")){
        	  st="4";
          }
          else if(st.equals("5-历史")){
        	  st="5";
          }
          else if(st.equals("6-教育")){
        	  st="6";
          }
          else if(st.equals("7-娱乐")){
        	  st="7";
          }
          else if(st.equals("8-生活")){
        	  st="8";
          }
          else{st="9";}
          String title=request.getParameter("title");
          String writer=request.getParameter("writer");
          String abst=request.getParameter("abst");
          String content=request.getParameter("content");
          int bmon=Integer.parseInt(st);
          News news=new News();
          news.setNid(nid);
          news.setBmon(bmon);
          news.setTitle(title);
          news.setWriter(writer);
          news.setAbst(abst);
          news.setContent(content);
          int t=0;
          t=NewsBiz.editNews(news);
          if(t>0){
                  out.print("<script>alert('修改新闻成功！！！');location='admin-index.jsp';</script>");
                 }
          else{
        	   out.print("<script>alert('修改新闻失败！！！');location='admin-index.jsp';</script>");
              }
         %>     
  </body>
</html>
