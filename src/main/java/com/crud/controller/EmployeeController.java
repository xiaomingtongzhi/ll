package com.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	//单个批量二合一
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method = RequestMethod.DELETE)
	public Msg  deleteEmp(@PathVariable("ids") String ids) {
		//批量删除
		if(ids.contains("-")) {
			List<Integer> del_ids=new ArrayList<Integer>();
			
			String[] str_ids=ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			
			employeeService.deleteBatch(del_ids);
			
		}else {
			Integer id=Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		
		
		return Msg.success();
	}
	
	
	
	
	
	
//	如果直接发送ajax=PUT的请求会失败
//	  原因：tomcat不能直接封装put请求



	//员工更新方法
	@ResponseBody
	@RequestMapping(value="/emp/{lId}",method = RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		//request.getParameter(name);,HttpServletRequest request
		
		
		//System.out.println("2"+employee);		
		employeeService.updateEmp(employee);
		
		return Msg.success();
	}
	
	
	//根据id查询员工信息
	@RequestMapping(value="/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee= employeeService.getEmp(id);
		
		return Msg.success().add("emp", employee);
	}
	
	
	
	//检查用户名是否可用
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("lName")String lName) {
		//判断用户名是否是合法的表达式
		String regex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		//对比输入框数据是否符合规则
		if(!lName.matches(regex)) {
			return Msg.fail().
					add("va_msg", "请输入2-5位中文或6-16位大小写英文或数字的组合!");
		}
		
		boolean b=employeeService.checkUser(lName);
		
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().
					add("va_msg", "用户名已存在或不符合规则");
		}
		
	}
	
	
	
	//新增数据
	@RequestMapping(value="/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			//校验失败
			Map<String, Object> map=new HashMap<String, Object>();
			
			List<FieldError> errors=result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();			
		}
		
	}
	
	
	
	
	@RequestMapping("/emps")	
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		//这不是一个分页查询
		//引入PageHelper分页插件
		//在查询之前只需要调用,传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps= employeeService.getAll();
		//使用pageInfo包装查询后的结果,只需要将pageInfo交给页面就行
		//封装详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
		PageInfo page = new PageInfo(emps,5);
		return Msg.success().add("pageInfo",page);
	}
	
	
	/*==================================================================================*/
	
	//老式处理
	//@RequestMapping("/emps")						//默认显示第一页
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//这不是一个分页查询
		//引入PageHelper分页插件
		//在查询之前只需要调用,传入页码，以及每页的大小
		PageHelper.startPage(pn, 5);
		//startPage后面紧跟的这个查询就是一个分页查询
		List<Employee> emps= employeeService.getAll();
		//使用pageInfo包装查询后的结果,只需要将pageInfo交给页面就行
		//封装详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		
		return "list";
	}
}
