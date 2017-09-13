package org.lanqiao.service;

import java.util.List;

import org.lanqiao.entity.User;

public interface UserManageService {
	List<User> getAllUsers();
	
	void changeUserStatus(User user);
}
