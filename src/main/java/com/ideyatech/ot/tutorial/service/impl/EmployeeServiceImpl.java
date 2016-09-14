package com.ideyatech.ot.tutorial.service.impl;

import java.util.Date;
import java.util.List;

import org.opentides.service.impl.BaseCrudServiceImpl;
import org.springframework.stereotype.Service;

import com.ideyatech.ot.tutorial.dao.EmployeeDao;
import com.ideyatech.ot.tutorial.entity.Employee;
import com.ideyatech.ot.tutorial.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl extends BaseCrudServiceImpl<Employee> implements EmployeeService{

	@Override
	public Employee findByEmailAddress(String email) {
		// TODO Auto-generated method stub
		return getDao().findByEmailAddress(email);
	}

	@Override
	public List<Employee> findByFirstNameLike(String firstName) {
		// TODO Auto-generated method stub
		return getDao().findByFirstNameLike(firstName);
	}

	@Override
	public List<Employee> findBetweenBirthDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return getDao().findBetweenBirthDate(startDate, endDate);
	}

	@Override
	public EmployeeDao getDao() {
		return (EmployeeDao)super.getDao();
	}
}
