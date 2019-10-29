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
 * 使用spring的项目推荐使用spring的单元测试，可以自动注入需要的组件
 * */

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
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
		//创建spring IOC容器
//		ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//		
//		//从容器中获取mapper
//		DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
		
		//System.out.println(1);
		System.out.println(e);
		//d.insertSelective(new Department(null,"开发部"));
		
		
		//e.insertSelective(new Employee(null,"l","S","123@qq.com",1));
		
		//批量添加
		EmployeeMapper mappr=sql.getMapper(EmployeeMapper.class);
		for(int i=0;i<10;i++)
		{
			String uid=UUID.randomUUID().toString().substring(0, 5)+i;
			mappr.insertSelective(new Employee(null, uid, "M", uid+"123@qq.com", 1));
		}
		
		
				
	}
		
}
