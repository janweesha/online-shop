<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<style type="text/css">
  		body
  		{
  			background-color:#B9B9FF;
  		}
  		a
  		{
  			color:black;
  		}
  		#content div
  		{
  			float: left;
  		}
  	</style>
  	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
  </head>
  <body>
  	<div id="content">
  		<c:forEach items="${itemList}" var="item">
			<div style="text-align: center;height: 200px;padding: 10px 0px;">
				<a href="#">
					<img 
					src="${pageContext.request.contextPath}/resources/img/head/head.jpg"
					width="120px" height="120px">
				</a>
				<p><a href="#">${item.i_name}</a></p>
				<p><font color="red">&yen;${item.i_price}</font></p>
			</div>  		
  		</c:forEach>
  	</div>
  </body>
</html>
