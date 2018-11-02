<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户注册页面</title>
    
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
  <form action="${pageContext.request.contextPath}/userRegister.action" method="post" id="form1">
  <!-- 隐藏框指定访问adminServlet的login方法 -->
    <TABLE align="center">
    	<TR>
    		<TD>
    		</TD>
    		<TD class="td" colspan="1" align="center">
    		<font color="black" style="font-size: 30px;">请注册</font>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">用户名:</TD>
    		<TD class="td">
    		<input name="u_name" 
    		type="text" 
    		id="u_name" 
    		value="输入用户名"
    		onfocus="regNameFocus()" 
    		onblur="regNameBlur()">
    		</TD>
    		<TD>
    			<div class="help-block" id="nameMsg">填个用户名吧</div>
    			<div class="help-block" id="usedMsg" style="display: inline;"></div>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">密码:</TD>
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
    		<TD class="td">确认密码:</TD>
    		<TD class="td">
    		<input name="u_checkPwd" 
    		type="text" 
    		id="u_checkPwd" 
    		value="确认密码"
    		onfocus="checkPwdFocus();"
    		 onblur="checkPwdBlur();"/>
    		</TD>
    		<TD>
    			<div class="help-block" id="checkPwdMsg1">确认下密码吧</div>
    			<div class="help-block" id="checkPwdMsg2">两次密码不一致呢</div>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">邮箱:</TD>
    		<TD class="td">
    		<input name="u_mail"
    		 type="text" 
    		 id="u_mail" 
    		 value="输入注册邮箱账号"
    		 onfocus="mailFocus();"
    		onblur="mailBlur();">
    		</TD>
    		<TD>
    			<div class="help-block" id="mailMsg">你忘填邮箱了</div>
    			<font color="red"  style="font-size: 10px;font-style: italic;">
    			${requestScope.emailError}
    			</font>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">验&nbsp;证&nbsp;码:</TD>
    		<TD class="td">
    		<input name="u_checkNum" 
    		type="text"
    		 id="u_checkNum" 
    		 value="输入验证码"
    		 onfocus="checkNumFocus();"
    		 onblur="checkNumBlur();"/>
    		</TD>
    		<TD class="td">
    			<img id="checkNumImg" src="${pageContext.request.contextPath}/VerifyCodeServlet" 
    			height="40" align="middle"  style="cursor:hand" onclick="changeCheckImg()"><br>
    			<font color="black"  style="font-size: 10px;font-style: italic;">
    			点击图片刷新</font>
    		</TD>
    		<TD>
    			<font color="red"  style="font-size: 10px;font-style: italic;">
    			${requestScope.imageMess}
    			</font>
    			<div class="help-block" id="checkNumMsg">填个验证码吧</div>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">
    		</TD>
    		<TD class="td" colspan="1" align="center">
    		<img id="reg_btn" 
    		src="${pageContext.request.contextPath}/resources/img/icon/icon_reg.png" 
    		align="middle"  
    		style="cursor:hand" 
    		onclick="checkRegister()">
    		<img id="log_btn" 
    		src="${pageContext.request.contextPath}/resources/img/icon/icon_log.png" 
    		align="middle"  
    		style="cursor:hand" 
    		onclick="window.location.href='${pageContext.request.contextPath}/user/login.jsp'">
    		</TD>
    	</TR>
    </TABLE>
    </form> 
  </body>
</html>
