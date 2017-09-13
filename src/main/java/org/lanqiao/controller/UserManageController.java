package org.lanqiao.controller;

import java.util.List;

import org.lanqiao.entity.User;
import org.lanqiao.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserManageController {

	@Autowired
	UserManageService userManageService;

	@RequestMapping("/backstageuser")
	public String backstageUser() {
		return "backstageuser";
	}

	@RequestMapping("/showAllUsers")
	@ResponseBody
	public List<User> showAllUsers() {
		return userManageService.getAllUsers();
	}

	@RequestMapping("/changeUserStatus")
	@ResponseBody
	public String changeUserStatus(User user) {
		if (user.getLogo()!=1&&user.getLogo()!=2&&user.getLogo()!=3) {
			return "flase";
		} else {
			userManageService.changeUserStatus(user);
			return "true";
		}
	}
}
