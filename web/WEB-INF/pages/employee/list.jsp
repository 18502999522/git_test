<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/bs_pagination/jquery.bs_pagination.min.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bs_pagination/en.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bs_pagination/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/form_bind.js"></script>
<script>
	$(function(){

		$("#pagination").bs_pagination({
			currentPage:${pageInfo.pageNum},//当前页号
			rowsPerPage: ${pageInfo.pageSize},//每页记录数
			totalPages:${pageInfo.pages},//总共页号
			totalRows: ${pageInfo.total},//总记录数
			visiblePageLinks: 5,//页码导航标签个数
			showGoToPage: true,//是否显示直接去多少页的跳转
			showRowsPerPage: true,//是否显示每页记录数
			showRowsInfo: true,//是否显示行记录信息
			onChangePage: function(event,data) {
				window.location.href = "${pageContext.request.contextPath}/employee/list?pageNum=" + data.currentPage + "&pageSize=" + data.rowsPerPage;
			}
		});

		$("#saveBut").click(function(){

			$("#emplForm").submit();

		});

		$("#editBut").click(function(){

			var checkedEmplIds = $("[name='emplId']:checked");

			if(checkedEmplIds.length > 1){

				showMsg("最多选择一项");

			}else if(checkedEmplIds.length < 1){

				showMsg("至少选择一项");

			}else{
				//ajax取数
				$.getJSON("${pageContext.request.contextPath}/employee/getAjax", { id: checkedEmplIds.val()}, function(json){
					loadData("emplEditForm",json)
					//显示模态框
					$("#editUserModal").modal("show");
			    });
			}
		});

		$("#editSaveBut").click(function(){

			$("#emplEditForm").submit();
		});

		$("#deleteBut").click(function(){

			var checkedEmplIds = $("[name='emplId']:checked");

			if(checkedEmplIds.length < 1){
				showMsg("至少选择一项");
				return;
			}

			//弹出询问框
			askMsg("确认删除吗?");

		});

		$("#delConfirmBut").click(function(){

			$("#delForm").submit();


		});

		$("#startTime").datetimepicker({

			language:'zh-CN',
			autoclose: true,
			format:'yyyy-mm-dd hh:ii:ss',
			minuteStep:1,
			todayBtn:true,
			pickerPosition: "bottom-left",
			/*startView:'year',
			minView:'year'*/

			startView:1,
			//minView:4,
			//todayHighlight:true







		});
	});

	function showMsg(msg){

		var msgModalDiv = $("#msgModal");

		msgModalDiv.find(".modal-body").html(msg);

		msgModalDiv.modal("show");

		setTimeout(function(){

			msgModalDiv.modal("hide");
		},3000);
	}

	function askMsg(msg){

		var msgModalDiv = $("#askModal");

		msgModalDiv.find(".modal-body").html(msg);

		msgModalDiv.modal("show");

	}


</script>

</head>
<body>
	<!-- 显示提示信息的模态框 -->
	<div class="modal fade" id="msgModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
					</button>
					<h4 class="modal-title">提示信息</h4>
				</div>
				<div class="modal-body" style="color:red"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 询问信息的模态框 -->
	<div class="modal fade" id="askModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
					</button>
					<h4 class="modal-title">确认信息</h4>
				</div>
				<div class="modal-body" style="color:red"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="delConfirmBut">确定</button>
				</div>
			</div>
		</div>
	</div>

<!-- 创建用户的模态窗口 -->
<div class="modal fade" id="createUserModal" role="dialog">
	<div class="modal-dialog" role="document" style="width: 90%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增用户</h4>
			</div>
			<div class="modal-body">

				<form id="emplForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/employee/save" method="post">

					<div class="form-group">
						<label for="create-loginActNo" class="col-sm-2 control-label">登录帐号<span style="font-size: 15px; color: red;">*</span></label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="text" class="form-control" id="create-loginActNo" name="emplNo">
						</div>
						<label for="create-username" class="col-sm-2 control-label">用户姓名</label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="text" class="form-control" id="create-username" name="emplName">
						</div>
					</div>
					<div class="form-group">
						<label for="create-loginPwd" class="col-sm-2 control-label">登录密码<span style="font-size: 15px; color: red;">*</span></label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="password" class="form-control" id="create-loginPwd" name="emplPwd">
						</div>
						<label for="create-confirmPwd" class="col-sm-2 control-label">确认密码<span style="font-size: 15px; color: red;">*</span></label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="password" class="form-control" id="create-confirmPwd">
						</div>
					</div>
					<div class="form-group">
						<label for="create-email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="text" class="form-control" id="create-email" name="emplMail">
						</div>
						<label for="create-expireTime" class="col-sm-2 control-label">失效时间</label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="text" class="form-control" id="create-expireTime" name="emplMail">
						</div>
					</div>
					<div class="form-group">
						<label for="create-lockStatus" class="col-sm-2 control-label">锁定状态</label>
						<div class="col-sm-10" style="width: 300px;">
							<select class="form-control" id="create-lockStatus" name="emplLockState">
								<option value="">请选择</option>
								<option value="1">启用</option>
								<option value="0">锁定</option>
							</select>
						</div>
						<label for="create-org" class="col-sm-2 control-label">部门<span style="font-size: 15px; color: red;">*</span></label>
						<div class="col-sm-10" style="width: 300px;">
							<select class="form-control" id="create-dept">
								<option value="">请选择</option>
								<option value="1">市场部</option>
								<option value="2">策划部</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP</label>
						<div class="col-sm-10" style="width: 300px;">
							<input type="text" class="form-control" id="create-allowIps" style="width: 280%" placeholder="多个用逗号隔开" name="emplAllowIps">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button id="saveBut" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
			</div>
		</div>
	</div>
</div>

	<!-- 修改用户的模态窗口 -->
	<div class="modal fade" id="editUserModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">修改用户</h4>
				</div>
				<div class="modal-body">

					<form id="emplEditForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/employee/saveUpdate" method="post">

						<div class="form-group">
							<label for="create-loginActNo" class="col-sm-2 control-label">登录帐号<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" name="emplNo">
								<input type="hidden" class="form-control" name="emplId" >
							</div>
							<label for="create-username" class="col-sm-2 control-label">用户姓名</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" name="emplName">
							</div>
						</div>
						<div class="form-group">
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" name="emplMail">
							</div>
							<label for="create-expireTime" class="col-sm-2 control-label">失效时间</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control"  name="emplExpireTime">
							</div>
						</div>
						<div class="form-group">
							<label for="create-lockStatus" class="col-sm-2 control-label">锁定状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" name="emplLockState">
									<option value="">请选择</option>
									<option value="1">启用</option>
									<option value="0">锁定</option>
								</select>
							</div>
							<label for="create-org" class="col-sm-2 control-label">部门<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" name="deptId">
									<option value="">请选择</option>
									<option value="1">市场部</option>
									<option value="2">策划部</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="create-allowIps" class="col-sm-2 control-label">允许访问的IP</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" style="width: 280%" placeholder="多个用逗号隔开" name="emplAllowIps">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="editSaveBut" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>用户列表</h3>
			</div>
		</div>
	</div>
	
	<div class="btn-toolbar" role="toolbar" style="position: relative; height: 80px; left: 30px; top: -10px;">
		<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
		  
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-addon">用户姓名</div>
		      <input class="form-control" type="text">
		    </div>
		  </div>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-addon">部门名称</div>
		      <input class="form-control" type="text">
		    </div>
		  </div>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-addon">锁定状态</div>
			  <select class="form-control">
			  	  <option></option>
			      <option>锁定</option>
				  <option>启用</option>
			  </select>
		    </div>
		  </div>
		  <br><br>
		  
		  <div class="form-group">
		    <div class="input-group">
		      <div class="input-group-addon">失效时间</div>
			  <input class="form-control" type="text" id="startTime" />
		    </div>
		  </div>
		  
		  ~
		  
		  <div class="form-group">
		    <div class="input-group">
			  <input class="form-control" type="text" id="endTime" />
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-default">查询</button>
		  
		</form>
	</div>
	
	
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px; width: 110%; top: 20px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createUserModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-default" data-toggle="modal" id="editBut"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
		  <button type="button" class="btn btn-danger" id="deleteBut"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
		
	</div>
	
	<div style="position: relative; left: 30px; top: 40px; width: 110%">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" /></td>
					<td>序号</td>
					<td>员工工号</td>
					<td>用户姓名</td>
					<td>部门名称</td>
					<td>邮箱</td>
					<td>失效时间</td>
					<td>允许访问IP</td>
					<td>锁定状态</td>
					<td>创建者</td>
					<td>创建时间</td>
					<td>修改者</td>
					<td>修改时间</td>
				</tr>
			</thead>
			<tbody>
				<form id="delForm" action="${pageContext.request.contextPath}/employee/delBatch" method="post">
			<c:forEach var="employee" items="${pageInfo.list}" varStatus="vs">
				<tr class="active">
					<td><input type="checkbox" name="emplId" value="${employee.emplId}" /></td>
					<td>${(pageInfo.pageNum - 1) * pageInfo.pageSize + vs.count}</td>
					<td><a  href="detail.html">${employee.emplNo}</a></td>
					<td>${employee.emplName}</td>
					<td>${employee.deptId}</td>
					<td>${employee.emplMail}</td>
					<td><fmt:formatDate value="${employee.emplExpireTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td>${employee.emplAllowIps}</td>
					<td>${employee.emplLockState eq 1 ? "启用" : "<font color=red>禁用</font>"}</td>
					<td>${employee.createBy}</td>
					<td><fmt:formatDate value="${employee.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${employee.updateBy}</td>
					<td><fmt:formatDate value="${employee.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</c:forEach>
				</form>
			</tbody>
		</table>

	</div>

	<div id="pagination"  style="height: 70px; position: relative;top: 35px; left: 10px;">

	</div>



</body>
</html>