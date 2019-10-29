package com.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.crud.bean.Employee;
import com.crud.bean.EmployeeExample;
import com.crud.bean.EmployeeExample.Criteria;
import com.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {


	@Autowired
	EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	/*
	 * 员工保存
	 * */
	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	//检验用户名是否重复
	public boolean checkUser(String lName) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria c=example.createCriteria();
		//criteria.andn
		c.andLNameEqualTo(lName);
		
		long con=employeeMapper.countByExample(example);
		//没有匹配的值(0)，返回ture，可用
		return con==0;
	}

	
	//按照id查询相应数据
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee=employeeMapper.selectByPrimaryKey(id);
		
		return employee;
	}

	
	//员工更新
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	
	//员工删除
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		//根据主键删除
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria cr=example.createCriteria();
		cr.andLIdIn(ids);
		
		employeeMapper.deleteByExample(example);
	}





}
