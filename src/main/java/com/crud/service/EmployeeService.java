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
	 * ��ѯ����Ա��
	 * @return
	 */
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	/*
	 * Ա������
	 * */
	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	//�����û����Ƿ��ظ�
	public boolean checkUser(String lName) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria c=example.createCriteria();
		//criteria.andn
		c.andLNameEqualTo(lName);
		
		long con=employeeMapper.countByExample(example);
		//û��ƥ���ֵ(0)������ture������
		return con==0;
	}

	
	//����id��ѯ��Ӧ����
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee=employeeMapper.selectByPrimaryKey(id);
		
		return employee;
	}

	
	//Ա������
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	
	//Ա��ɾ��
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		//��������ɾ��
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
