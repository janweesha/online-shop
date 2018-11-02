<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户关系系统主页</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico"/>
    <style type="text/css">
    	body
    	{
    		margin:0px;
    	}
    	#top
    	{
    		width:100%;
    		height:10%;
    		background-color:#FCFCFC;
    	}
    	#navi
    	{
    		width:100%;
    		height:6%;
    		background-color:#3C3C3C;
    	}
    	#main
    	{
    		width:100%;
    		height:82%;
    		background-color:#B9B9FF;
    	}
    </style>
  </head>
  <body marginheight="0" marginwidth="0">
  	<div id="top">
  		<%@include file="/top.jsp" %>
  	</div>
  	<div id="navi">
  		<div><%@include file="/cata/list.jsp" %></div>
  		<div class="clear" style="clear: both;"></div>
  	</div>
  	<div id="main">
  		<%@include file="/main.jsp"%>
  	</div>
  </body>
</html>
