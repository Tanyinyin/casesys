
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改角色信息</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
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
        <li><a href="#">角色管理</a></li>
        <li><a href="#">基本信息</a></li>
    </ul>
</div>

<div class="formbody">
    <div class="formtitle"><span>角色基本信息</span></div>
	<form class="layui-form" action="<%= basePath%>/biz/SysRole_add.action" method="post">
  		<input name="sysRole.roleId" type="hidden" value="${sysRole.roleId}"/>
		<div class="layui-form-item">
			<label class="layui-form-label">角色编号：</label>
			<div class="layui-input-inline">
				${sysRole.roleId}
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称：</label>
			<div class="layui-input-inline"> 
				<input type="text" name="sysRole.roleName" lay-verify="required" value="${sysRole.roleName}" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个汉字</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序序号：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysRole.roleSortOrder" lay-verify="required" value="${sysRole.roleSortOrder}" autocomplete="off" class="layui-input" >
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
			    	<input type="checkbox" name="rightId" class="dfinput1"  value="${rightId}" id="rightId_${rightId}" title="${rightName}" lay-skin="primary">
			    </div>
		    </s:iterator>
	    </div>
        <div class="layui-input-block" style="margin-top: 15px;">
     	    <button class="scbtn" lay-submit lay-filter="sysRole">确认保存</button>
            <a href="<%= basePath%>/biz/SysRole_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
    	<s:iterator value="roleRights" id="w">
        	<li><input name="rightId" type="hidden" class="roleRight" value="${rightId}"/></li>
        </s:iterator>
  	</form>
</div>
    <script type="text/javascript">
	  //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	  layui.use(['common','form'], function(){
		  var $ = layui.jquery, common = layui.common,form = layui.form;
		  $(".dfinput1").each(function () {//循环获取所有权限编号
              rightId = $(this).attr("value");
              $(".roleRight").each(function () {//循环获取该角色拥有的权限编号
                  //判断权限表中的权限编号是否与角色拥有的权限编号是否相同
                  if (rightId == $(this).attr("value")) {
                      //若相同,则选中
                      $("#rightId_" + rightId).attr("checked", true);
                  }
              });
          }); 
		  form.render();
	      form.on('submit(sysRole)', function(data){
	    	   // layer.msg(JSON.stringify(data.field));
	        return true;
	      });
	      $(".cancel").on('click',function(){
              window.location.href = "<%= basePath%>/biz/SysRole_list.action";
          });
	  });
    </script>
</body>

</html>
