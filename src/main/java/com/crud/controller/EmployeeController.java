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
	
	//������������һ
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method = RequestMethod.DELETE)
	public Msg  deleteEmp(@PathVariable("ids") String ids) {
		//����ɾ��
		if(ids.contains("-")) {
			List<Integer> del_ids=new ArrayList<Integer>();
			
			String[] str_ids=ids.split("-");
			//��װid�ļ���
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
	
	
	
	
	
	
//	���ֱ�ӷ���ajax=PUT�������ʧ��
//	  ԭ��tomcat����ֱ�ӷ�װput����



	//Ա�����·���
	@ResponseBody
	@RequestMapping(value="/emp/{lId}",method = RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		//request.getParameter(name);,HttpServletRequest request
		
		
		//System.out.println("2"+employee);		
		employeeService.updateEmp(employee);
		
		return Msg.success();
	}
	
	
	//����id��ѯԱ����Ϣ
	@RequestMapping(value="/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee= employeeService.getEmp(id);
		
		return Msg.success().add("emp", employee);
	}
	
	
	
	//����û����Ƿ����
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("lName")String lName) {
		//�ж��û����Ƿ��ǺϷ��ı��ʽ
		String regex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		//�Ա�����������Ƿ���Ϲ���
		if(!lName.matches(regex)) {
			return Msg.fail().
					add("va_msg", "������2-5λ���Ļ�6-16λ��СдӢ�Ļ����ֵ����!");
		}
		
		boolean b=employeeService.checkUser(lName);
		
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().
					add("va_msg", "�û����Ѵ��ڻ򲻷��Ϲ���");
		}
		
	}
	
	
	
	//��������
	@RequestMapping(value="/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			//У��ʧ��
			Map<String, Object> map=new HashMap<String, Object>();
			
			List<FieldError> errors=result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("������ֶ�����"+fieldError.getField());
				System.out.println("������Ϣ��"+fieldError.getDefaultMessage());
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
		//�ⲻ��һ����ҳ��ѯ
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ����,����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 5);
		//startPage��������������ѯ����һ����ҳ��ѯ
		List<Employee> emps= employeeService.getAll();
		//ʹ��pageInfo��װ��ѯ��Ľ��,ֻ��Ҫ��pageInfo����ҳ�����
		//��װ��ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������,����������ʾ��ҳ��
		PageInfo page = new PageInfo(emps,5);
		return Msg.success().add("pageInfo",page);
	}
	
	
	/*==================================================================================*/
	
	//��ʽ����
	//@RequestMapping("/emps")						//Ĭ����ʾ��һҳ
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//�ⲻ��һ����ҳ��ѯ
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ����,����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 5);
		//startPage��������������ѯ����һ����ҳ��ѯ
		List<Employee> emps= employeeService.getAll();
		//ʹ��pageInfo��װ��ѯ��Ľ��,ֻ��Ҫ��pageInfo����ҳ�����
		//��װ��ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������,����������ʾ��ҳ��
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		
		return "list";
	}
}
