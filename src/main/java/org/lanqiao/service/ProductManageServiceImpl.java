package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.ProductDao;
import org.lanqiao.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductManageServiceImpl implements ProductManageService {

	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> getAllProducts(Integer now, Integer size) {
		int begin = (now - 1) * size;
		return productDao.selectAllProducts(begin, size);
	}

	@Override
	public void addProduct(Product product) {
		productDao.insertProduct(product);
	}

	@Override
	public void changeProduct(Product product) {
		productDao.updateProduct(product);
	}

	@Override
	public void deleteProduct(Integer productId) {
		productDao.deleteProduct(productId);
	}

	@Override
	public List<Product> getAllProductsR() {
		return productDao.selectAllProductsR();
	}

}
