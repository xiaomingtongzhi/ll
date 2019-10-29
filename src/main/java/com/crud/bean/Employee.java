package com.crud.bean;

import javax.validation.constraints.Pattern;



public class Employee {
    private Integer lId;

    
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
    		message = "2-5λ���Ļ�6-16λ��СдӢ�Ļ����ֵ����")
    private String lName;

    private String gender;

    //@Email
    @Pattern(regexp ="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
    		message = "�����ʽ����ȷ")
    private String email;

    private Integer dId;
    
    
    
    
    private Department department;
    public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}

	
	
	
	
	public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName == null ? null : lName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
	public Employee(Integer lId, String lName, String gender, String email, Integer dId) {
		super();
		this.lId = lId;
		this.lName = lName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
    
    
}