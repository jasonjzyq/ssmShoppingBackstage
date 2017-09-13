package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserManageServiceImpl implements UserManageService {

	@Autowired
	UserDao userDao;

	@Override
	public List<User> getAllUsers() {
		return userDao.selectAllUsers();
	}

	@Override
	public void changeUserStatus(User user) {
		userDao.updateUserStatus(user);
	}

}
