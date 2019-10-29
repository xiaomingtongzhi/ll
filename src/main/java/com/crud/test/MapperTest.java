package com.crud.test;


import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;

/*
 * ʹ��spring����Ŀ�Ƽ�ʹ��spring�ĵ�Ԫ���ԣ������Զ�ע����Ҫ�����
 * */

@RunWith(SpringJUnit4ClassRunner.class)     //��ʾ�̳���SpringJUnit4ClassRunner��
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

public class MapperTest {

	@Autowired
	DepartmentMapper d;
	
	@Autowired
	EmployeeMapper e;
	
	@Autowired	
	SqlSession sql;
	
	
	@Test
	public void testCRUD() {
		//����spring IOC����
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		
//		//�������л�ȡmapper
//		DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
		
		//System.out.println(1);
		System.out.println(e);
		//d.insertSelective(new Department(null,"������"));
		
		
		//e.insertSelective(new Employee(null,"l","S","123@qq.com",1));
		
		//�������
		EmployeeMapper mappr=sql.getMapper(EmployeeMapper.class);
		for(int i=0;i<10;i++)
		{
			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
			mappr.insertSelective(new Employee(null, uid, "M", uid+"123@qq.com", 1));
		}
		
		
				
	}
		
}
