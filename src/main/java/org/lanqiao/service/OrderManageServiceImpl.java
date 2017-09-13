package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.OrderDao;
import org.lanqiao.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderManageServiceImpl implements OrderManageService{

	@Autowired
	OrderDao orderDao;
	
	@Override
	public List<Order> getAllOrder() {
		return orderDao.selectAllOrders();
	}

	@Override
	public void changeOrder(Order order) {
		orderDao.updateOrder(order);
	}

}
