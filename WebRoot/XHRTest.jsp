<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'XHRTest.jsp' starting page</title>

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
    <input type="button" id="btn1" value="发送请求报文" onclick="sendRequest();"><br>
    <h3></h3>
    <script type="text/javascript">
    	simlexhr=
    	{
    		doxhr:function(container,url)
    		{
    			if(!document.getElementById||!document.createTextNode)//测试是否支持DOM以及你要写入内容的元素是否可用
    			{
    				return;
    			}

    			//将脚本存到一个叫outputContainer的属性里，使他在所有其他方法中可以使用
    			simplexhr.outputContainer=document.getElementById(container);
    			if(!simplexhr.ouputContainer)
    			{
    				return;
    			}

    			var request;//定义request变量

    			//使用try结构检测支持哪个版本的XHR
    			try
    			{
    				request=new XMLHttpRequest();//尝试赋予一个新的XMLHttpRequest()对象
    			}
    			catch(error)//如果不支持
    			{
    				try
    				{
    					request=new ActiveXObject('Microsoft.XMLHTTP');//尝试赋一个微软的ActiveXObject控件对象
    				}
    				catch(error)//如果不支持
    				{
    					return true;//返回true，浏览器只会打开连接并显示文本
    				}
    			}

    			//调用open方法
    			request=open('get',url);

    			//readyState属性,0:不存在连接，1：连接正在加载，2：数据已经加载完成，3：连接正在交互，4：数据已发已收,连接已完成
    			request.onreadystatechange=function()
    			{
    				//请求初始化时给用户反馈信息
    				if(request.readyState==1)
    				{
    					simplexhr.outputContainer.innerHTML='loading...';
    				}
    				//请求完成时
    				if(request.readyState==4)
    				{
    					//检查status属性
    					if(/200|304/.test(request.status))//如果状态是 200或304，那么文件已经接收到了
    					{
    						simplexhr.retrieved(request);
    					}
    					else
    					{
    						simplexhr.failed(request);
    					}
    				}
    			}
    			request.send(null);//把请求发送到服务器
    			return false;
    		},
    		failed:function(requester)
    		{
    			alert('XMLHttpRequest请求失败.错误码：'+requester.status);
    			return true;
    		},
    		retrieved:function(requester)
    		{
    			var data=requester.responseText;
    			data = data.replace(/\n/g,'<br/>');
    			simplexhr.outputxhr.outputContainer.innerHTML=data;
    			return false;
    		}
    	}

    	function sendRequest()
    	{
    		//新建异步对象
    		var xhr;
    		try
    			{
    				xhr=new XMLHttpRequest();//尝试赋予一个新的XMLHttpRequest()对象
    			}
    			catch(error)//如果不支持
    			{
    				try
    				{
    					xhr=new ActiveXObject('Microsoft.XMLHTTP');//尝试赋一个微软的ActiveXObject控件对象
    				}
    				catch(error)//如果不支持
    				{
    					return true;//返回true，浏览器只会打开连接并显示文本
    				}
    			}
    		//请求行
    		xhr.open('get','${pageContext.request.contextPath}/xhrTest.action?name=janwee&pwd=123456');
    		//回调函数
    		xhr.onload=function()
    		{
    			//console.log('请求响应回来了！');
    			/* console.log(xhr.responseText);
    			if((String)${successMsg}!=null)
    			{
    				alert('${successMsg}');
    			}  */
    			document.querySelector('h3').innerHTML=xhr.responseText;
    			
    		}
    		//请求头
    		xhr.setRequestHeader('heima','good good study');
    		//请求主体&发送
    		xhr.send(null);
    	}
    	window.onload=sendRequest;
    </script>
  </body>
</html>
