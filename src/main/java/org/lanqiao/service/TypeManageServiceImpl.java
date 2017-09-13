package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.TypeDao;
import org.lanqiao.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class TypeManageServiceImpl implements TypeManageService{

	@Autowired
	TypeDao typeDao;
	
	@Override
	public List<Type> showAllType() {
		return typeDao.selectAllProductsType();
	}

	@Override
	public void addType(Type type) {
		typeDao.insertProductType(type);
	}

	@Override
	public void changeType(Type type) {
		typeDao.updateProductType(type);
	}

	@Override
	public void deleteType(Integer typeId) {
		typeDao.deleteProductType(typeId);
	}

}
