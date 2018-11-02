package com.goodz.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.goodz.entity.User;
import com.goodz.service.IUserService;
import com.goodz.utils.MailUtils;
import com.sun.mail.smtp.SMTPAddressFailedException;

@Controller
@SessionAttributes("username")
public class UserAction{
	@Resource(name="userService")
	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/userRegister")
	public String register(Model model,User user,String u_checkNum,HttpServletRequest request) throws Exception
	{
		try {
			MailUtils.sendMail("janwee_sha@126.com", user.getU_mail(), 
					"注册成功,请点击下面的链接激活你的账户！<br>" +
					"<a href='http://localhost:8080/goodz/active.action" +
					"?u_name="+user.getU_name()+"'"+
					">点此激活！</a>");
			String sessionNum=(String)request.getSession().getAttribute("sessionNum");
			
			System.out.println(user.getU_name());
			System.out.println(u_checkNum);
			if(u_checkNum.equals(sessionNum))
			{
				if(userService.addUser(user))
				{
					model.addAttribute("successMsg", "注册成功");
					request.getSession().setAttribute("username", user.getU_name());
					return "/user/registerSuccess.jsp";
				}
				else
				{
					model.addAttribute("errorMsg", "账号已存在，请直接登录！");
					return "/user/register.jsp";
				}
			}
			else
			{
				model.addAttribute("imageMess","验证码错误");
				return "/user/register.jsp";
			}
		}catch(SMTPAddressFailedException e)
		{
			model.addAttribute("emailError", "注册失败，请检查你的邮箱地址！");
			return "/user/register.jsp";
		}
		catch (Exception e)
		{
			
			throw e;
		}
	}
	
	@RequestMapping("/userExists")
	public void exists(HttpServletResponse response,String name) throws Exception
	{
		response.setContentType("text/html;charset=utf-8");
		if(userService.findByName(name)!=null)
		{
			response.getWriter().print("<font color='maroon'>用户名被占用</font>");
		}
		else
		{
			response.getWriter().print("<font color='green'>用户名可使用</font>");
		}
	}
	
	@RequestMapping("/userLogin")
	public String login(Model model,User user,String u_checkNum,HttpServletRequest request) throws Exception
	{
		String sessionNum=(String)request.getSession().getAttribute("sessionNum");
		User dbUser=userService.findByNameAndPwd(user);
		if(u_checkNum.equals(sessionNum))
		{
			if(dbUser!=null)
			{
				if(dbUser.getU_state()==1)
				{
					model.addAttribute("successMsg","成功登录");
					//登录成功后将User对象放入会话
					request.getSession().setAttribute("user", dbUser);
					return "/main/index.jsp";
				}
				else
				{
					model.addAttribute("errorMsg", "账号未激活");
					return "/user/login.jsp";
				}
			}
			else
			{
				model.addAttribute("errorMsg", "登录失败");
				return "/user/login.jsp";	
			}
		}
		else
		{
			model.addAttribute("imageMess", "验证码错误！");
			return "/user/login.jsp";		
		}
	}
	
	@RequestMapping("/active")
	public String active(Model model,String u_name)
	{
		if(userService.active(u_name))
		{
			model.addAttribute("successMsg", "激活成功，请登录！");
			return "/user/login.jsp";//
		}
		else
		{
			model.addAttribute("errorMsg", "激活失败，请检查你的邮箱地址！");
			return "/user/register.jsp";//
		}
	}
	
	@RequestMapping("/uploadHead")
	public String uploadHead(Model model,HttpServletRequest request) throws Exception
	{
		User user=(User)request.getSession().getAttribute("user");
		//判断上传表单是否为mutipart/form-data类型
		if(ServletFileUpload.isMultipartContent(request))
		{
			//1.创建diskFileItemFactory对象，设置缓冲区大小和临时文件目录
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//默认临时文件夹
			System.out.println(System.getProperty("java.io.tmpdir"));
			
			//2.创建ServletUpload对象并设置文件大小限制
			ServletFileUpload fileUpload=new ServletFileUpload(factory);
			//不能超过10M
			fileUpload.setFileSizeMax(10*1024*1024);
			fileUpload.setHeaderEncoding("UTF-8");
			
			//3.解析request对象，得到一个保存了所有内容的List对象
			List<FileItem> fileItems=fileUpload.parseRequest(request);
			Iterator<FileItem> iterator=fileItems.iterator();
			
			//4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
			while(iterator.hasNext())
			{
				FileItem fileItem=iterator.next();
				//如果是普通表单元素
				if(fileItem.isFormField())
				{
					String key=fileItem.getFieldName();
					String value=fileItem.getString("UTF-8");
					System.out.println("("+key+","+value+")");
				}
				//如果是<input type="file">上传文件元素
				else
				{
					String fileName=fileItem.getName();
					System.out.println("原文件名："+fileName);
					
					String prefix="E:/goodz/user/head";
					
					String suffix=fileName.substring(fileName.lastIndexOf("."));
					System.out.println("拓展名："+suffix);
					
					String newFileName=new Date().getTime()+suffix;
					System.out.println("新文件名："+newFileName);
					
					//5.调用fileItem的write()方法，上传文件
					fileItem.write(new File(prefix+newFileName));
					
					//6.删除临时文件
					fileItem.delete();
					
					//7.写入数据库
					if(userService.setHead(prefix+newFileName, user.getU_id()))
					{
						model.addAttribute("successMsg", "上传成功");
						request.getSession().setAttribute("fileName", newFileName);
						//${pageContext.request.contextPath}/resources/img/head/head_1.jpg
						request.getSession().setAttribute("headPath", prefix+newFileName);
					}
					else
					{
						model.addAttribute("errorMsg", "上传失败(错误码：1)");
					}
				}
						
			}
		}
		else
		{
			model.addAttribute("errorMsg", "上传失败(错误码：2)");
		}
		return "/user/uploadHead.jsp";
	}
	
	@RequestMapping("/userExit")
	public String userExit(HttpServletRequest request)
	{
		//销毁Session
		request.getSession().invalidate();
		//重定向到login.jsp
		return "/user/login.jsp";
	}
	
	@RequestMapping(value="/xhrTest",method=RequestMethod.GET)
	public void xhrTest(HttpServletResponse response,String name,String pwd) throws IOException
	{
		response.setContentType("text/html;charset=utf-8");
		System.out.println("姓名："+name);
		System.out.println("密码："+pwd);
		response.getWriter().print("你好，"+name);
	}
}
