function getPage()
		{
			//请求行
			var xhr;
			try
	    	{
	    		xhr=new XMLHttpRequest();
	    	}
	    	catch(error)
	    	{
	    		try
	    		{
	    			xhr=new ActiveXObject('Microsoft.XMLHTTP');
	    		}
	    		catch(error)
	        	{
	        		return true;
	        	}
	    	}
			xhr.open('get','/goodz/returnCatas.action');
			//请求头'Content-type','application/x-www-form-urlencoded'
			//xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
			//回调函数
			xhr.onload=function()
			{
				var arr=JSON.parse(xhr.responseText);
				$("#c_ul").append("<li><a href='/goodz/index.jsp'>首页</a></li>");
				$(arr).each(function()
				{
					$("#c_ul").append("<li><a href='#'>"+this.c_name+"</a></li>");
				});
			}
			//请求主体&发送
			xhr.send(null);
		};