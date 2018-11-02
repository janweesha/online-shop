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

  </head>
  
  <body>
  <form action="${pageContext.request.contextPath}/userRegister.action" method="post">
  <!-- 隐藏框指定访问adminServlet的login方法 -->
  	 <%
    String errorMsg=(String)request.getAttribute("errorMsg");
    /* String name;
    if(request.getAttribute("name")!=null)
    {
    	name=(String)request.getAttribute("name");
    } */
   %>
    <TABLE align="center">
    	<TR>
    		<TD class="td">用户名:</TD>
    		<TD class="td">
    		<input name="u_name" type="text" id="u_name">
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">密码:</TD>
    		<TD class="td">
    		<input name="u_pwd" type="password" id="u_pwd"/>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">确认密码:</TD>
    		<TD class="td">
    		<input name="checkPwd" type="password" id="checkPwd"/>
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">邮箱:</TD>
    		<TD class="td">
    		<input name="u_mail" type="text" id="mail">
    		</TD>
    	</TR>
    	<TR>
    		<TD class="td">验&nbsp;证&nbsp;码:</TD>
    		<TD class="td">
    		<input name="checkNum" type="text" id="checkNum" style="width: 80"/>
    		<img id="checkNumImg" src="${pageContext.request.contextPath}/VerifyCodeServlet" 
    		height="40" align="middle"  style="cursor:hand" onclick="changePic()">
    		</TD>
    		<TD class="td">
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
    		<TD class="td" colspan="2" align="center">
    		<input type="submit" name="submit" value="注&nbsp;册" style="cursor:hand"/>
    		<a href="${pageContext.request.contextPath}/user/login.jsp">已有账号？前往登录</a>
    		</TD>
    	</TR>
    </TABLE>
    </form>
    <script type="text/javascript">
  		function changePic(){
        // 获取img元素
        // 为了让浏览器发送请求到servlet, 所以一定要改变src
        document.getElementsByTagName("img")[0].src =
            "${pageContext.request.contextPath}/VerifyCodeServlet?time=" + new Date().getTime();
    };
    
    	function checkSubmit()
    	{
    		var name=document.getElementById("u_name").value;
    		var pwd=document.getElementById("u_pwd").value;
    		var checkPwd=document.getElementById("checkPwd").value;
    		
    		if(name.length>0)
    		{
    			if(pwd.length>0)
    			{
    				if(checkPwd.length>0)
    				{
    					if(pwd==checkPwd)
    					{
    						alert("成功");
    					}
    				}
    			}
    		}
    		
    	}
</script> 
  </body>
</html>
