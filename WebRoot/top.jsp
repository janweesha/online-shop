<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户关系系统主页</title>
    <style type="text/css">
    	body
    	{
    		margin: 0px;
    	}
    	a
    	{
    		text-decoration: none;
    	}
    	/* #brand
    	{
    		width:10%;
    		height:10%;
    		float: left;
    	}
    	#blank
    	{
    		width:50%;
    		height:10%;
    		float: left;
    	}
    	#buttons
    	{
    		width:40%;
    		height:10%;
    		float: left;
    	} */
    </style>
  </head>
  <%-- <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background-color:menu;">
  <div id="brand" align="center">
  	<img id="reg_btn" 
    	src="${pageContext.request.contextPath}/resources/img/icon/icon_brand.png" 
    	align="middle"
    	height="35px"
    	width="58px"><br>
    	西大二手网
  </div>
  <div id="blank" align="center"></div>
  <div id="buttons" align="center">
  	<a style="color:red;" href="${pageContext.request.contextPath}/user/uploadHead.jsp" target="_parent">上传头像</a>
    <font style="color:black;">用户:${sessionScope.user.u_name}!|</font>
    <a style="color:red;" href="${pageContext.request.contextPath}/userExit.action" target="_parent">退出</a>
  </div> --%>
  	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="top">
  		<tr>
  			<td class="logo" width="10%" align="left">
  						<img id="reg_btn" 
    						src="${pageContext.request.contextPath}/resources/img/icon/icon_brand.png" 
    						align="middle"
    						height="35px"
    						width="58px">
  			</td>
  			<td width="10%">
  				<a style="color:red;" href="${pageContext.request.contextPath}/user/uploadHead.jsp" target="_parent">${sessionScope.user.u_name}</a>
  				<a style="color:red;" href="${pageContext.request.contextPath}/user/uploadHead.jsp" target="_parent">上传头像</a>
  			</td>
  			<td width="60%">
  			</td>
  			<td  align="right" width="20%">
  					<a style="color:red;" href="${pageContext.request.contextPath}/user/login.jsp" target="_parent">登录</a>
  					<a style="color:red;" href="${pageContext.request.contextPath}/user/register.jsp" target="_parent">注册</a>
    				<a style="color:red;" href="${pageContext.request.contextPath}/userExit.action" target="_parent">退出</a>
  			</td>
  		</tr>
  	</table>
  </body>
</html>
