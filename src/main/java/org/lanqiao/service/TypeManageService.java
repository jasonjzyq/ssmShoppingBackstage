package org.lanqiao.service;

import java.util.List;

import org.lanqiao.entity.Type;

public interface TypeManageService {
	public List<Type> showAllType();
	
	public void addType(Type type);
	
	public void changeType(Type type);
	
	public void deleteType(Integer typeId);
}
