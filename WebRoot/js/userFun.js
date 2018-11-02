function changeCheckImg()
    {
        document.getElementsByTagName("img")[0].src =
            "/goodz/VerifyCodeServlet?time=" + new Date().getTime();
    };
    
    
    
    function logNameFocus()
    {
    	var nameInput=document.getElementById("u_name");
    	if(nameInput.value=="输入用户名")
    	{
    		nameInput.value="";
    	}
    };
    
    function logNameBlur()
    {
    	var nameInput=document.getElementById("u_name");
    	if(nameInput.value.length==0)
    	{
    		nameInput.value="输入用户名";
    	}
    };
    
    function regNameFocus()
    {
    	var nameInput=document.getElementById("u_name");
    	if(nameInput.value=="输入用户名")
    	{
    		nameInput.value="";
    	}
    };
    
    function regNameBlur()
    {
    	var nameInput=document.getElementById("u_name");
    	var usedMsg=document.getElementById("usedMsg");
    	//var unusedMsg=document.getElementById("unusedMsg");
    	
    	if(nameInput.value.length==0)
    	{
    		nameInput.value="输入用户名";
    	}
    	else
    	{
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
        	usedMsg.innerHTML="<font color='green'>正在检查用户名...</font>";
        	xhr.open("post","/goodz/userExists.action");
        	//get方式没必要设置
        	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
        	xhr.onload=function()
        	{
        		//document.querySelector('h3').innerHTML=xhr.responseText;
        		console.log(xhr.responseText);
        		usedMsg.innerHTML=xhr.responseText;
        	}
        	xhr.send('name='+nameInput.value);
    	}
    	
    };
    
    
     function pwdFocus()
    {
    	var pwdInput=document.getElementById("u_pwd");
    	if(pwdInput.value=="输入密码")
    	{
    		pwdInput.type="password";
    		pwdInput.value="";
    	}
    };
    
    function pwdBlur()
    {
    	var pwdInput=document.getElementById("u_pwd");
    	if(pwdInput.value.length==0)
    	{
    		pwdInput.type="text";
    		pwdInput.value="输入密码";
    	}
    };
    
    function checkPwdFocus()
    {
    	var checkPwdInput=document.getElementById("u_checkPwd");
    	if(checkPwdInput.value=="确认密码")
    	{
    		checkPwdInput.type="password";
    		checkPwdInput.value="";
    	}
    };
    
    function checkPwdBlur()
    {
    	var checkPwdInput=document.getElementById("u_checkPwd");
    	if(checkPwdInput.value.length==0)
    	{
    		checkPwdInput.type="text";
    		checkPwdInput.value="确认密码";
    	}
    };
    
     function checkNumFocus()
    {
    	var checkNumInput=document.getElementById("u_checkNum");
    	if(checkNumInput.value=="输入验证码")
    	{
    		checkNumInput.value="";
    	}
    };
    
    function checkNumBlur()
    {
    	var checkNumInput=document.getElementById("u_checkNum");
    	if(checkNumInput.value.length==0)
    	{
    		checkNumInput.value="输入验证码";
    	}
    };
    
    function mailFocus()
	{
    	var mailInput=document.getElementById("u_mail");
		if(mailInput.value=="输入注册邮箱账号")
		{
			mailInput.value="";
		}
	}
	
	function mailBlur()
	{
		var mailInput=document.getElementById("u_mail");
		if(mailInput.value.length==0)
		{
			mailInput.value="输入注册邮箱账号";
		}
	};
    
    function checkLogin()
    {
    	var name=document.getElementById("u_name").value;
    	var pwd=document.getElementById("u_pwd").value;
    	var checkNum=document.getElementById("u_checkNum").value;
    	
    	var nameMsg=document.getElementById("nameMsg");
    	var pwdMsg=document.getElementById("pwdMsg");
    	var checkNumMsg=document.getElementById("checkNumMsg");
    		
    	if(name.length==0||name=='输入用户名')
    	{
    		nameMsg.style.display='inline';
    		return;
    	}
    	if(pwd.length==0||pwd=='输入密码')
    	{
    		pwdMsg.style.display='inline';
    		return;
    	}
    	if(checkNum.length==0||checkNum=='输入验证码')
    	{
    		checkNumMsg.style.display='inline';
    		return;
    	}
    	form1.submit();
    };
    function checkRegister()
    {
    	var name=document.getElementById("u_name").value;
    	var pwd=document.getElementById("u_pwd").value;
    	var checkPwd=document.getElementById("u_checkPwd").value;
    	var checkNum=document.getElementById("u_checkNum").value;
    	var mail=document.getElementById("u_mail").value;
    	
    	var nameMsg=document.getElementById("nameMsg");
    	var pwdMsg=document.getElementById("pwdMsg");
    	var checkPwdMsg1=document.getElementById("checkPwdMsg1");
    	var checkPwdMsg2=document.getElementById("checkPwdMsg2");
    	var checkNumMsg=document.getElementById("checkNumMsg");
    	var mailMsg=document.getElementById("mailMsg"); 
    		
    	if(name.length==0||name=='输入用户名')
    	{
    		nameMsg.style.display='inline';
    		return;
    	}
    	if(pwd.length==0||pwd=='输入密码')
    	{
    		pwdMsg.style.display='inline';
    		return;
    	}
    	if(checkPwd.length==0||checkPwd=='确认密码')
    	{
    		checkPwdMsg1.style.display='inline';
    		return;
    	}
    	if(pwd!=checkPwd)
    	{
    		checkPwdMsg2.style.display='inline';
    		return;
    	}
    	if(mail.length==0||mail=='输入注册邮箱账号')
    	{
    		mailMsg.style.display='inline';
    		return;
    	}
    	if(checkNum.length==0||checkNum=='输入验证码')
    	{
    		checkNumMsg.style.display='inline';
    		return;
    	}
    	form1.submit();
    };