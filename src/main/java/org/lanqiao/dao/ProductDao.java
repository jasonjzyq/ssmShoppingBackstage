package org.lanqiao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lanqiao.entity.Product;

public interface ProductDao {
	int deleteByPrimaryKey(Integer productId);

	int insert(Product record);

	int insertSelective(Product record);

	Product selectByPrimaryKey(Integer productId);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKey(Product record);

	// 查询所有商品
	List<Product> selectAllProducts(@Param("begin")Integer begin,@Param("size")Integer size);

	// 添加商品
	void insertProduct(Product product);

	// 更新商品
	void updateProduct(Product product);

	// 删除商品
	void deleteProduct(Integer productId);
	
	//记录数
	List<Product> selectAllProductsR();
}