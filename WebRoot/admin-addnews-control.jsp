
+<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<%@ page import="com.jspsmart.upload.*" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
 <% 
  SmartUpload up=new SmartUpload();
  up.initialize(pageContext);//初始化
  String picpath="";//文件路径
  boolean b=true;
  try{
	  up.setAllowedFilesList("jpg,jpeg,bmp");//允许上传的文件
	  up.setDeniedFilesList("exe,jsp,bat");//拒绝上传的文件
	  up.setMaxFileSize(1024*1024*3);//单张图片应小于3m
	  up.setTotalMaxFileSize(1024*1024*10);//图片总大小应小于10m
	  up.upload();//进行上传
	  for(int i=0;i<up.getFiles().getCount();i++){
		  com.jspsmart.upload.SmartFile file=up.getFiles().getFile(i);//得到上传信息
		  picpath=file.getFilePathName();//获取文件路径
		  file.saveAs("d:/temp//"+file.getFileName(),SmartUpload.SAVE_PHYSICAL);//设置文件在服务器中的保存位置  
		  }
	  }
  catch(Exception e){
	 	  e.printStackTrace();
	 	  out.print("<script>alert('添加图片失败！！！请换个文件试试')</script>");
	 	  b=false;
	  }
  if(b==true){
              com.jspsmart.upload.SmartRequest uprequest=up.getRequest();//重新获取request的值
              String str=uprequest.getParameter("bmon");//获得新闻所属的主题编号
              String title=uprequest.getParameter("title");
              String writer=uprequest.getParameter("writer");
              String abst=uprequest.getParameter("abst");
              String content=uprequest.getParameter("content");
              int bmon=Integer.parseInt(str);
              News news=new News();
              news.setBmon(bmon);
              news.setTitle(title);
              news.setWriter(writer);
              news.setPicpath(picpath);
              news.setAbst(abst);
              news.setContent(content);
              int t=0;
              t=NewsBiz.addNews(news);
              if(t>0&b==true){
	                           out.print("<script>alert('添加新闻成功！！！');location='admin-addnews.jsp';</script>");
	             }
            }
  else{
	   out.print("<script>alert('添加新闻失败！！！');location='admin-addnews.jsp';</script>");
       }
  %>
  </body>
</html>