package com.goodz.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodz.entity.Cata;
import com.goodz.service.CataService;

@Controller
public class CataAction {
	@Resource(name="cataService")
	private CataService cataService;
	
	public void setCataService(CataService cataService) {
		this.cataService = cataService;
	}
	
	/*@RequestMapping("/returnCatas")
	public @ResponseBody List<Cata> returnAll(HttpServletResponse response) throws IOException
	{
		//1.设置响应编码
		response.setContentType("text/html;charset=utf-8");
		//先访问redis获取list
		List<Cata> list=cataService.findAllFromRedis();
		//2.访问service层，返回list
		list= cataService.findAll();
		
		//将list返回给Ajax请求
		return list;
		
	}*/
	
	@RequestMapping("/returnCatas")
	public @ResponseBody List<Cata> returnAll(HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=utf-8");
		List<Cata> list= cataService.findAll();
		return list;
		
	}
}
