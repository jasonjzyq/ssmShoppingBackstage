package org.lanqiao.dao;

import org.lanqiao.entity.ProductPic;

public interface ProductPicDao {
    int insert(ProductPic record);

    int insertSelective(ProductPic record);
}