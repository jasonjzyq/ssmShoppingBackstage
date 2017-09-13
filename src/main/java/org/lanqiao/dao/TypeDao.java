package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Type;

public interface TypeDao {
    int deleteByPrimaryKey(Integer typeId);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
    
	// 查询所有商品类型
	List<Type> selectAllProductsType();

	// 添加商品类型
	void insertProductType(Type type);

	// 更新商品类型
	void updateProductType(Type type);

	// 删除商品类型
	void deleteProductType(Integer typeId);
}