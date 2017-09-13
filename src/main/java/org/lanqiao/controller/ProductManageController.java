package org.lanqiao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.lanqiao.entity.Product;
import org.lanqiao.entity.Type;
import org.lanqiao.service.ProductManageService;
import org.lanqiao.service.TypeManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductManageController {

	@Autowired
	ProductManageService productManageService;

	@RequestMapping("/backstageProduct")
	public String backstageProduct() {
		return "backstageProduct";
	}

	@RequestMapping("/showAllProduct")
	@ResponseBody
	public Map<String, Object> showAllProduct(String page, String rows) {
		int count = productManageService.getAllProductsR().size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", productManageService.getAllProducts(Integer.parseInt(page), Integer.parseInt(rows)));
		return map;
	}

	@RequestMapping("/addProduct")
	@ResponseBody
	public void addProduct(Product product, String typeId) {
		Type type = new Type();
		type.setTypeId(Integer.parseInt(typeId));
		product.setType(type);
		productManageService.addProduct(product);
	}

	@RequestMapping("/changeProduct")
	@ResponseBody
	public void changeProduct(Product product, String typeId) {
		Type type = new Type();
		type.setTypeId(Integer.parseInt(typeId));
		product.setType(type);
		productManageService.changeProduct(product);
	}

	@RequestMapping("/deleteProduct")
	@ResponseBody
	public String deleteProduct(String productId) {
		productManageService.deleteProduct(Integer.parseInt(productId));
		return "{\"success\":\"删除成功\"}";
	}

	@Autowired
	TypeManageService typeManageService;

	@RequestMapping("/getAllType")
	@ResponseBody
	public List<Type> getAllType() {
		return typeManageService.showAllType();
	}

}
