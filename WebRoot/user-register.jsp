<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册页</title>
<style  type="text/css">
      #all{height:800px;{border:0px;margin-top:0px;margin-bottom:0px;}
	  #top{height:50px;border:0px;width:100%;}
	  #middle{height:650px;border:0px;left;width:100%}
	  #down{height:100px;border:0px;width:100%;}
</style>
<script type="text/javascript">
  function checkInfo(){
	  if(document.from1.username.value==""){
		  alert("用户名不能为空");
		  return(false);
	  }
	  if(document.from1.pwd.value==""){
		  alert("密码不能为空");
		  return(false);
	  }
	  if(document.from1.secondpwd.value!=document.from1.pwd.value){
		  alert("两次输入密码不一致");
		  return(false);
	  }
	  if(document.from1.email.value==""){
		  alert("电子邮箱不能为空");
		  return(false);
	  }
	  var flag=0 
	  for(i=0;i<from1.uknown.length;i++){
	  if(from1.uknown[i].checked==true){  //判断是否选中
	      flag=1; 
	      break ;
	      } 
	  }
	  if(flag!=1){
	      alert("您是如何知道到我们网站的不能为空"); 
	      return false ;
	  }
	  var flag=0 
	  for(i=0;i<from1.sex.length;i++){
	  if(from1.sex[i].checked==true){ 
	      flag=1; 
	      break ;
	    } 
	  }
	  if(flag!=1){
	      alert("性别不能为空"); 
	      return false ; 
      }
}	    
</script>
</head>
	<body>
    <div id="all">
    <div id="top">
    </div>
    <div id="middle">
		<form name="from1" method="post" action="user-register-control.jsp" onSubmit="return checkInfo()">
		<p>用&nbsp户&nbsp名：<input type="text" name="username"></p>
		<p>密&nbsp&nbsp&nbsp码：<input type="password" name="pwd"></p>
		<p>重新输入密码：<input type="password" name="secondpwd"></p>
		<p>电子邮箱地址：<input type="text" name="email"></p>
		<table>
		<tr>
		<td>您是如何知道到我们网站的：</td>
		<td><input type="checkbox" name="uknown" value="报刊">报刊</td>
		<td><input type="checkbox" name="uknown" value="网络">网络</td>
		<td><input type="checkbox" name="uknown" value="电视">电视</td>
		<td><input type="checkbox" name="uknown" value="亲朋推荐">亲朋推荐</td>
		</tr>
		</table>
	    <p>性别：<input type="radio" value="男" name="sex">男
                 <input type="radio" value="女" name="sex">女 </p>
        <p><input type="submit" value="注册"><input type="reset" value="取消"></p>
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