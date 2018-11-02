<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录界面</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico"/>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		div
		{
			font-size:4px;
			color: maroon;
			font-style:italic;
			display: none;
		}
	</style>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/userFun.js"></script>
  </head>
  <body background="${pageContext.request.contextPath}/resources/img/background/img_bg04.jpg" style="background-repeat: no-repeat;background-size:100%;background-attachment: fixed;">
  	<form action="${pageContext.request.contextPath}/userLogin.action" method="post" id="form1">
    <TABLE align="center">
    	<TR>
    		<TD>
    		</TD>
    		<TD class="td" colspan="1" align="center">
    		<font color="black" style="font-size: 30px;">请登录</font></TD>
    	</TR>
    	<TR>
    		<TD class="td">
    		<font color="black" style="font-size: 20px;font-style: italic;">管理员:</font>
    		</TD>
    		<TD class="td">
    		<input name="u_name" 
    			type="text" 
    			id="u_name" 
    			onfocus="logNameFocus();" 
    			onblur="logNameBlur();"
    			value="输入用户名"/>
    		</TD>
    		<TD>
    			<div class="help-block" id="nameMsg">填个用户名吧</div>
    			<font color="red">${requestScope.errorMsg}</font>
    			<font color="green">${requestScope.successMsg}</font>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">
    		<font color="black" style="font-size: 20px;font-style: italic;">密码:</font>
    		</TD>
    		<TD class="td">
    		<input name="u_pwd"
    		 type="text" 
    		 id="u_pwd" 
    		 value="输入密码"
    		 onfocus="pwdFocus();"
    		 onblur="pwdBlur();"/>
    		</TD>
    		<TD>
    			<div class="help-block" id="pwdMsg">填个密码吧</div>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">
    		<font color="black" style="font-size: 20px;font-style: italic;">验证码:</font>
    		</TD>
    		<TD class="td" valign="top">
    		<input name="u_checkNum" 
    		type="text" 
    		id="u_checkNum"
    		value="输入验证码"
    		onfocus="checkNumFocus();"
    		onblur="checkNumBlur();"/>
    		<div class="help-block" id="checkNumMsg">填个验证码吧</div>
    		</TD>
    		<TD class="td">
    		<img id="checkNumImg" src="${pageContext.request.contextPath}/VerifyCodeServlet" 
    		height="40" align="middle" style="cursor:hand" onclick="changeCheckImg();"/>
    		<font color="black"  style="font-size: 10px;font-style: italic;">
    		点击图片刷新<br>
    		</font>
    		<font color="red"  style="font-size: 10px;font-style: italic;">
    		${requestScope.imageMess}
    		</font>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">
    		</TD>
    		<TD class="td" colspan="1" align="center">
    		<img id="log_btn" 
    		src="${pageContext.request.contextPath}/resources/img/icon/icon_log.png" 
    		align="middle"  
    		style="cursor:hand" 
    		onclick="checkLogin();">
    		<img id="reg_btn" 
    		src="${pageContext.request.contextPath}/resources/img/icon/icon_reg.png" 
    		align="middle"  
    		style="cursor:hand" 
    		onclick="window.location.href='${pageContext.request.contextPath}/user/register.jsp'">
    		</TD>
    		<TD class="td">
    		</TD>
    	</TR>
    </TABLE>
    </form>
  </body>
</html>
