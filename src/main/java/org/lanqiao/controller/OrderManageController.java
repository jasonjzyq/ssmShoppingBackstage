package org.lanqiao.controller;

import java.util.List;

import org.lanqiao.entity.Order;
import org.lanqiao.service.OrderManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderManageController {

	@RequestMapping("backstageOrder")
	public String backstageOrder(){
		return "backstageOrder";
	}
	
	@Autowired
	OrderManageService orderManageService;
	
	@RequestMapping("showAllOrder")
	@ResponseBody
	public List<Order> showAllOrder(){
		return orderManageService.getAllOrder();
	}
	
	@RequestMapping("changeOrder")
	@ResponseBody
	public void changeOrder(Order order){
		orderManageService.changeOrder(order);
	}
	
}
