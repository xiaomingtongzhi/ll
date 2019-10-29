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
			 	<button class="btn btn-info">新增</button>
			 	<button class="btn btn-warning">删除</button>
			 </div>
		</div>

<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
			<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>所属部门</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="l">
						<tr>

							<th>${l.lId}</th>
							<th>${l.lName}</th>
							<th>${l.gender=="M"?"男":"女"}</th>
							<th>${l.email}</th>
							<th>${l.department.deptName}</th>
							<th>
							<button class="btn btn-info btn-sm">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							修改
							</button>
				 			<button class="btn btn-warning btn-sm">
				 			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				 			删除
				 			</button>
							</th>
						</tr>
					</c:forEach>
			</table>		
					
		</div>




	<div class="row">
		<!-- 分页文字信息 -->
		<div class="col-md-6">
		当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total }条记录
		</div>
		
		<!-- 分页条信息 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
				  <ul class="pagination">
				  

					<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
				  <c:if test="${pageInfo.hasPreviousPage}">
				    <li>
				      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>



				    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
				   		 <c:if test="${page_Num == pageInfo.pageNum }">
				    		<li class="active"><a href="#">${page_Num}</a></li>
				    	</c:if>
				    	
				   		 <c:if test="${page_Num != pageInfo.pageNum }">
				   		    <!-- 发送跳转页请求 -->
				   		 	<li><a href="${APP_PATH }/emps?pn=${page_Num}">${page_Num}</a></li>
				   		 </c:if>
				    </c:forEach>
				    

				   			    
				    
				    				    
					<c:if test="${pageInfo.hasNextPage}">
				    <li>
				      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				    	<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
				    
				  </ul>
				</nav>
		</div>
	</div>
	<div class="row"></div>
</div>
</div>
</body>
</html>