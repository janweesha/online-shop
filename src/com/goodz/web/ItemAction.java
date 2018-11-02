package com.goodz.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goodz.entity.Item;
import com.goodz.service.ItemService;
import com.goodz.utils.JSONUtils;

@Controller
public class ItemAction {
	@Resource(name="itemService")
	private ItemService itemService;
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
	@RequestMapping("/returnItems")
	public  String returnItems(Model model) throws IOException
	{
		List<Item> list=itemService.findAll();
		//String jsonStr=JSONUtils.beanToJson(list);
		model.addAttribute("itemList", list);
		return "/main/index.jsp";
	}
}
