<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>


<!-- http://localhost:3366/crud -->
<!-- 代替上面代码 -->
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/strap/jquery/jquery-3.4.1.min.js"></script>
<!-- 引入样式 -->

<link href="${APP_PATH}/strap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/strap/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>


<!-- 修改信息的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
        <h4 class="modal-title">修改数据</h4>
      </div>
      
      
      
      <div class="modal-body">
        <form class="form-horizontal">
        
			  <div class="form-group">
			    <label class="col-sm-2 control-label">lName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="emp_update_static"></p>
			    
			    <span  class="help-block">
			    
			    </span>
			    
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="输入邮箱">
			    
			    <span  class="help-block">
			    
			    </span>
			    
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			      <label class="radio-inline">
						<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
						<input type="radio" name="gender" id="gender2_update_input" value="S" checked="checked"> 女
				  </label>
			    </div>
			    			  
			  <!-- 模态框 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select multiple class="form-control" name="dId" >
				</select>
			    </div>
			  </div>		  
			</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>













<!-- 添加信息的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
        <h4 class="modal-title" id="myModalLabel">添加数据</h4>
      </div>
      
      
      
      <div class="modal-body">
        <form class="form-horizontal">
        
			  <div class="form-group">
			    <label class="col-sm-2 control-label">lName</label>
			    <div class="col-sm-10">
			      <input type="text" name="lName" class="form-control" id="lName_add_input" placeholder="输入名字">
			    
			    <span  class="help-block">
			    
			    </span>
			    
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="输入邮箱">
			    
			    <span  class="help-block">
			    
			    </span>
			    
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			      <label class="radio-inline">
						<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
						<input type="radio" name="gender" id="gender2_add_input" value="S" checked="checked"> 女
				  </label>
			    </div>
			    			  
			  <!-- 模态框 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select multiple class="form-control" name="dId" >
				</select>
			    </div>
			  </div>		  
			</form>
      </div>
      
      
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>




<!-- 显示页面 -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
			<!-- 占12列，它规定的 -->
			<div class="col-md-12">
			<h1>ssm</h1>
	</div>
</div>
		<!-- 按钮 -->
		<div class="row">
			<!-- 右偏移8格 -->
			 <div class="col-md-4 col-md-offset-10">
			 	<button class="btn btn-info" id="emp_add_modal_btn">新增</button>
			 	<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			 </div>
		</div>
<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
			<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="check_all"/>
						</th>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>所属部门</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>		
					
		</div>




	<div class="row">
		<!-- 分页文字信息 -->
		<div class="col-md-6" id="page_info_area">
		
		</div>
		
		<!-- 分页条信息 -->
		<div class="col-md-6" id="page_nav_area">
			
		</div>
	</div>

</div>
</div>


<script type="text/javascript">
	//读取总记录数
	var totalRecord;
	//读取当前页码
	var currentPage;

	//1、页面加载完成后，直接去发送一个ajax请求，要到分页数据
	$(function(){
		//开始进入首页
		to_page(1);
	});
	
	
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1.解析并显示数据
				build_emps_table(result);
				//2.解析并显示分页信息
				build_page_info(result);
				//3.解析显示分页条
				build_page_nav(result);
				
			}
			
		});
	}
	
	
	
	
	function build_emps_table(result) {
		//清空之前读出的数据
		$("#emps_table tbody").empty();
		
		var emps=result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			//弹窗
			//alert(item.lName);
			
			//全选框
			var checkBoxId=$("<td><input type='checkbox' class='check_item'/></td>");
			
			var lIdTd=$("<td></td>").append(item.lId);
			var lNameTd=$("<td></td>").append(item.lName);
			var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
			var emailTd=$("<td></td>").append(item.email);
			var departmentTd=$("<td></td>").append(item.department.deptName);
			
			/*
					<button class="btn btn-info btn-sm">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						修改
					</button>
			*/
			//定义完成后使用append方法
			var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			
			//为编辑按钮添加一个自定义的属性，来表示当前的id		
			editBtn.attr("edit-id",item.lId);
			
			
			var delBtn=$("<button></button>").addClass("btn btn-warning btn-sm delete_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			
			//为删除按钮添加一个自定义的属性，来表示当前删除的id	
			delBtn.attr("del-id",item.lId);
			
			//美化
			var btnTd=$("<td></td>").append(editBtn).append("  ").append(delBtn);
			
			//append方法执行后返回原来的元素
			$("<tr></tr>").append(checkBoxId)
			.append(lIdTd)
			.append(lNameTd)
			.append(genderTd)
			.append(emailTd)
			.append(departmentTd)
			.append(btnTd)
			//把它获取的数据传入页面
			.appendTo("#emps_table tbody");
		});
	}
	
	//解析显示分页信息
	function build_page_info(result){
		//清空之前读出的数据
		$("#page_info_area").empty();
		
		$("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页"+"    ",
				"总共"+result.extend.pageInfo.pages+"页"+"    ",
				"总共"+result.extend.pageInfo.total+"条记录");
		
		
		totalRecord=result.extend.pageInfo.total;
		
		currentPage=result.extend.pageInfo.pageNum;
	}
	
	//解析显示分页条
	function build_page_nav(result) {
		//清空之前读出的数据
		$("#page_nav_area").empty();
		
		
		//结合元素
		var ul=$("<ul></ul>").addClass("pagination");
		
		
		var firstPageLi=$("<li></li>").append($("<a></a>").append("首页")
				.attr("href","#"));
		
		var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
		
		
		
		//如果当前在第一页，首页和前一页按钮设置为不能被点击
		if(result.extend.pageInfo.hasPreviousPage==false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//添加点击翻页事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum-1);
			});
		}
		
		
		
		var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
		
		var lastPageLi=$("<li></li>").append($("<a></a>").append("末页")
				.attr("href","#"));		
		
		//同理
		if(result.extend.pageInfo.hasNextPage==false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			//添加点击翻页事件
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum+1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages);
			});
		}

		
		
		
		//添加首页和前一页
		ul.append(firstPageLi).append(prePageLi);	
		
		//遍历1.2.3页码
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			var numLi=$("<li></li>").append($("<a></a>").append(item));
			//判断如果读出页码为当前所在页码
			if(result.extend.pageInfo.pageNum==item){
				numLi.addClass("active");
			}
			//接收点击的页码动作并跳转
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		
		//添加末页和后一页
		ul.append(nextPageLi).append(lastPageLi);
		
		//把构建好的ul添加到nav
		var navEle=$("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}

	
	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
	
	
	//新增按钮的点击事件(加#)
	$("#emp_add_modal_btn").click(function(){
		//清除表单数据（重置表单）(重置提示信息)
		reset_form("#empAddModal form");
		
		//$("")[0].reset();
		//发送ajax请求，弹出部门信息，显示在下拉列表中
		getDepts("#empAddModal select");
		
		//弹出模态框
		$("#empAddModal").modal({
			backdrop:"static"
		});
	});
	
	//查出所有部门信息
	function getDepts(ele){
		//清空下拉列表的值
		$(ele).empty();
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"GET",
			success:function(result){
				//extend: {depts: [{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "开发部"}]}
				//console.log(result);
				
				//$("#dept_add_select").
				//$("#empAddModal select").append()
				$.each(result.extend.depts,function(){
					
					//遍历元素
					var optionEle=$("<option></option>").
					append(this.deptName).attr("value",this.deptId);
					
					optionEle.appendTo(ele);
				});
			}
		});
	}
	
	//校验表单数据(加#)
	function validate_add_form(){
		//取出需要校验的数据，使用正则表达式
		//校验名称
		var empName=$("#lName_add_input").val();
		var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		if(!regName.test(empName)){
			//打印提示信息
			//alert("2-5位中文或6-16位大小写英文或数字的组合");
			
			show_validate_msg("#lName_add_input","error","2-5位中文或6-16位大小写英文或数字的组合");
			
			//$("#lName_add_input").parent().addClass("has-error");
			//$("#lName_add_input").next("span").text("2-5位中文或6-16位大小写英文或数字的组合");
			return false;
		}else{
			show_validate_msg("#lName_add_input","success","");
			
			//$("#lName_add_input").parent().addClass("has-success");
			//$("#lName_add_input").next("span").text("");
		}
		
		//校验邮箱
		var email=$("#email_add_input").val();
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			//打印提示信息
			//alert("邮箱格式不正确");
			
			show_validate_msg("#email_add_input","error","邮箱格式不正确");
			
			//$("#email_add_input").parent().addClass("has-error");
			//$("#email_add_input").next("span").text("邮箱格式不正确");
			return false;
		}else{
			
			show_validate_msg("#email_add_input","success","");
			
			//$("#email_add_input").parent().addClass("has-success");
			//$("#email_add_input").next("span").text("");			
		}
		
		return true;
	}
	
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);			
		}else if("error"==status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);			
		}
	}
	
	
	//检查用户名是否重复
	$("#lName_add_input").change(function(){
		
		var lName=this.value;
		//发送ajax请求校验用户名是否重复
		$.ajax({
			url:"${APP_PATH}/checkuser",
			data:"lName="+lName,
			type:"POST",
			success:function(result){
				if(result.code==100){
					show_validate_msg("#lName_add_input","success","用户名可用");
					$("#emp_save_btn").attr("ajax-va","success");
				}else{
					show_validate_msg("#lName_add_input","error",result.extend.va_msg);
					$("#emp_save_btn").attr("ajax-va","error");
				}
			}
		});
		
	});
	
	
	
	//点击保存数据
	$("#emp_save_btn").click(function(){
		//模态框中填写的表单数据提交给服务器进行保存
		
		//对提交给服务器的数据进行校验比对
		if(!validate_add_form()){
			return false;
		};
		
		//判断用户名是否校验成功
		if($(this).attr("ajax-va")=="error"){
			return false;
		}
		
		//发送ajax请求保存员工
		//alert($("#empAddModal form").serialize());
		
		$.ajax({
			url:"${APP_PATH}/emp",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				if(result.code==100){
					//保存成功后的动作
					//关闭模态框
					$("#empAddModal").modal('hide');
					//跳转到最后一页，显示存储的数据
					to_page(totalRecord);					
				}else{
				//显示失败信息
				//console.log(result);
				//显示错误字段信息
				if(underfined!=result.extend.errorFields.lName){
					show_validate_msg("#email_add_input","error",result.extend.errorFields.lName);
				}
				if(underfined!=result.extend.errorFields.email){
					show_validate_msg("#lName_add_input","error",result.extend.errorFields.email);
				}
			}
		}
	});
	});
	
	
	
	//绑定修改信息的点击事件
	$(document).on("click",".edit_btn",function(){
		//alert("edit");
		
		//查出信息，并显示部门列表
		getDepts("#empUpdateModal select");
		//显示员工的信息
		getEmp($(this).attr("edit-id"));
		
		//弹出模态框的时候获取id，并传递给更新按钮
		$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
		
		//弹出模态框
		$("#empUpdateModal").modal({
			backdrop:"static"
		});		
	});
	
	
	function getEmp(id){
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				//console.log(result);
				var empDate=result.extend.emp;
				$("#emp_update_static").
				text(empDate.lName);
				$("#email_update_input").val(empDate.email);
				$("#empUpdateModal input[name=gender]").
				val([empDate.gender]);
				$("#empUpdateModal select").val([empDate.dId]);
			}
			
		});
	}
	
	
	//点击更新，更新数据库信息
	$("#emp_update_btn").click(function(){
		//校验邮箱
		var email=$("#email_update_input").val();
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			//打印提示信息
			//alert("邮箱格式不正确");
			
			show_validate_msg("#email_update_input","error","邮箱格式不正确");

			return false;
		}else{
			
			show_validate_msg("#email_update_input","success","");
		
		}		
		
		//发送ajax请求保存更新的数据
		$.ajax({
			url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(result){
				//+"&_method=PUT"
				//alert(result.msg);
				//关闭对话框
				$("#empUpdateModal").modal("hide");
				//回到本页面
				to_page(currentPage);
			}
		});
			
	});
	
	
	//单个删除
	$(document).on("click",".delete_btn",function(){
		//弹出是否确认删除的对话框
		//alert($(this).parents("tr").find("td:eq(1)").text());
		var empName=$(this).parents("tr").find("td:eq(1)").text();
		var empId=$(this).attr("del-id");
		
		//判断框,确认返回true，否则返回false
		if(confirm("确认删除"+empName+"吗？")){
			//确认发送ajax请求
			$.ajax({
				url:"${APP_PATH}/emp/"+empId,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//回到本页面
					to_page(currentPage);					
				}
			});
		}
		
	});	
	
	
	//全选/全不选功能实现
	$("#check_all").click(function(){
		//alert($(this).prop("checked"));
		$(".check_item").prop("checked",$(this).prop("checked"));
	});
	
	//check_item
	$(document).on("click",".check_item",function(){
		//判断是否已勾选当前页面所有元素
		//alert($(".check_item:checked").length);
		var flag=$(".check_item:checked").length==$(".check_item").length;
		$("#check_all").prop("checked",flag);
	});
	
	
	//点击全部删除，就批量删除
	$("#emp_delete_all_btn").click(function(){
		//$(".check_item:checked")
		var empNames="";
		var del_idstr="";
		
		$.each($(".check_item:checked"),function(){
			empNames +=$(this).parents("tr").find("td:eq(2)").text()+",";
			//组装员工id字符串
			del_idstr +=$(this).parents("tr").find("td:eq(1)").text()+"-";
			
		});
		//去除多余的，-
		empNames=empNames.substring(0,empNames.length-1);
		//del_idstr=del_idstr.substring(0,del_idstr.length-1);
		del_idstr=del_idstr.substring(0,del_idstr.length-1);
		
		if(confirm("确认删除"+empNames+"吗？")){
			//确认发送ajax请求
			$.ajax({
					url:"${APP_PATH}/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页面
						to_page(currentPage);
					}
				});
			}
	});
	
</script>

</body>
</html>