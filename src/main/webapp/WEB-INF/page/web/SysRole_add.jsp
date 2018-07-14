<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>角色-新增</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            var url = "/front/SysJson_checkRoleName.action";
            $("#roleId").blur(function () {//给角色编号添加失去焦点事件
                var id = $("input[name='roleId']").val();//获取角色编号值
                $.post(url, {"checkName": id}, function (data) {//发送请求验证角色编号
                    if (data == "no") {//如果返回 no,提示已存在
                        $("#gradeInfo").html("<font color=\"red\">您输入的编号存在！请重新输入！</font>");
                    } else {//否则隐藏
                        $("#gradeInfo").hide();
                    }
                }, "json");
            });
        });
    </script>
    <script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript"
            src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
     <script type="text/javascript">
		$(document).ready(function(){
            $(".cancel").on('click',function(){
                window.location.href = "<%= basePath%>/biz/SysRole_list.action";
            });
		});
	</script>
	<script>
	  //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	  layui.use(['common','form'], function(){
		  var $ = layui.jquery, common = layui.common,form = layui.form;
	      form.render();  
	      form.on('submit(sysRole)', function(data){
	    	   // layer.msg(JSON.stringify(data.field));
	        return true;
	      });
	  });
	 </script>
	 <style type="text/css">
   	 .layui-form-radioed i, .layui-form-radio i:hover {
    	color: #1E9FFF;
	 }
	 .layui-form-checked i, .layui-form-checked:hover i {
    	color: #1E9FFF;
	 }
	 .layui-form-checked, .layui-form-checked:hover {
    	border-color: #1E9FFF;
	 }
	 .layui-input-inline {
	    margin: 6px;
	    width: 170px;
	}
	.layui-form-checked[lay-skin="primary"] i {
	    border-color: #1E9FFF;
	    background-color: #1E9FFF;
	    color: #fff;
	}
	.layui-form-checkbox[lay-skin="primary"]:hover i {
	    border-color: #1E9FFF;
	    color: #fff;
	}
	.layui-btn-primary {
    line-height: 32px;
    border: 1px solid #ddd;
    background-color: #ddd;
    width: 85px;
    height: 35px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 3px;
    }
    .layui-btn-primary:hover {
   		border-color: #ddd;
   		color: #333;
    }
	</style>
</head>
<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">系统管理</a></li>
        <li><a href="#">新增角色</a></li>
    </ul>
</div>
   	<div class="formtitle"><span>角色基本信息</span></div>
	<form class="layui-form" action="<%= basePath%>/biz/SysRole_add.action" method="post">
   	
		<div class="layui-form-item">
			<label class="layui-form-label">角色编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="roleId" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
		<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>英文<span id="gradeInfo"></span></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称：</label>
			<div class="layui-input-inline">
				<input type="text" name="roleName" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个汉字</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序序号：</label>
			<div class="layui-input-inline">
				<input type="text" name="roleSortOrder" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>
		</div>
		<div class="layui-form-item">
		 
		<label class="layui-form-label">权限名称：</label>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>至少选择一个权限</div>
		</div>
	    <div class="layui-input-block">
		    <s:iterator value="sysRights" id="id">
			    <div class="layui-input-inline">
			    	<input type="checkbox" name="rightId" value="${rightId}" id="rightId_${rightId}" title="${rightName}" lay-skin="primary">
			    </div>
		    </s:iterator>
	    </div>
        <div class="layui-input-block" style="margin-top: 15px;">
     	    <button class="scbtn" lay-submit lay-filter="sysRole">确认保存</button>
            <a href="<%= basePath%>/biz/SysRole_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
  </form>
</body>

</html>
