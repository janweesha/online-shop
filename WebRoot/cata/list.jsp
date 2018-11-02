<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cataFun.js"></script>
    
    <style type="text/css">
    	body
    	{
    		background-color:#3C3C3C;
    	}
    	#cata
    	{
    		width: 70%;
    		float: left;
    	}
    	#blank
    	{
    		width: 15%;
    		float: left;
    	}
    	#search_ctx
    	{
    		width:15%;
    		float: left;
    	}
    	#search_btn
    	{
    		float: left;
    	}
    	ul
    	{
    		list-style:none;
    		margin:0px;
    		width: auto;
    		height: auto;
    		overflow:hidden;
    		clear:both;
    	}
    	
    	ul li
		{
    		float:left; /* 向左漂移，将竖排变为横排 */
		}

    	ul li a,ul li a:visited
    	{
    		background-color: #3C3C3C; /* 背景色 */
    		border: 1px #4e667d solid; /* 边框 */
    		color: #FFDCB9; /* 文字颜色 #dde4ec*/
    		font-size:20px;
    		display: block; /* 此元素将显示为块级元素，此元素前后会带有换行符 */
    		line-height: 1.35em; /* 行高 */
    		padding: 4px 20px; /* 内部填充的距离 */
    		text-decoration: none; /* 不显示超链接下划线 */
    		white-space: nowrap; /* 对于文本内的空白处，不会换行，文本会在在同一行上继续，直到遇到 <br> 标签为止。 */
    	}
    </style>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
  </head>
  <body 
  marginheight="0" marginwidth="0">
  <div id="parent">
  	<div id="cata" style="height: 100%;">
  		<ul id="c_ul">
  		</ul>
  		<div class="clearfloat"></div>
  	</div>
  	<div id="blank"> 
  	</div>
  	<div id="search_ctx">
  		<form id="form1" action="#">
  			<input type="text" name="context"/>
  		</form>
  	</div>
  	<div id="search_btn">
  		<img id="icon_search" 
    	src="${pageContext.request.contextPath}/resources/img/icon/icon_search1.png" 
    	align="middle"  
    	style="cursor:hand" 
    	onclick="window.location.href='${pageContext.request.contextPath}/user/login.jsp'">
  	</div>
  	</div>
  	<script type="text/javascript">
  	window.onload=getPage;
  	</script>
  </body>
</html>
