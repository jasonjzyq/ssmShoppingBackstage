package org.lanqiao.service;

import java.util.List;

import org.lanqiao.entity.Product;

public interface ProductManageService {
	
	public List<Product> getAllProducts(Integer begin,Integer size);
	
	public void addProduct(Product product);
	
	public void changeProduct(Product product);
	
	public void deleteProduct(Integer productId);
	
	public List<Product> getAllProductsR();
}
