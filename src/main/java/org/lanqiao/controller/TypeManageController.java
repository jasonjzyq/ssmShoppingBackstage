package org.lanqiao.controller;

import java.util.List;

import org.lanqiao.entity.Type;
import org.lanqiao.service.TypeManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TypeManageController {

	@RequestMapping("backstageProductType")
	public String backstageProductType(){
		return "backstageProductType";
	}
	
	@Autowired
	TypeManageService typeManageService;
	
	@RequestMapping("showAllType")
	@ResponseBody
	public List<Type> showAllType(){
		return typeManageService.showAllType();
	}
	
	@RequestMapping("addType")
	@ResponseBody
	public void addType(Type type){
		typeManageService.addType(type);
	}
	
	@RequestMapping("changeType")
	@ResponseBody
	public void changeType(Type type){
		typeManageService.changeType(type);
	}
	
	@RequestMapping("deleteType")
	@ResponseBody
	public String deleteType(Type type){
		typeManageService.deleteType(type.getTypeId());
		return "{\"success\":\"删除成功\"}";
	}
}
