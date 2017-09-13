package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Order;

public interface OrderDao {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
	// 查询所有订单
	List<Order> selectAllOrders();

	// 修改订单状态
	void updateOrder(Order order);
}