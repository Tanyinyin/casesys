<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户-新增</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
	<script type="text/javascript" src="<%= basePath%>/js/address.js"></script> 
    <script type="text/javascript" src="<%= basePath%>/third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
           /*  $(".select2").uedSelect({
                width: 155
            }); */
            $(".cancel").on('click',function(){
                window.location.href = "<%= basePath%>/biz/SysUser_list.action";
            });
        });
    </script>
    <script>
	  //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	  layui.config({  
          base : "../../js/" //address.js的路径  
      }).use(['common','form','address'], function(){
		  var $ = layui.jquery, common = layui.common,form = layui.form,address = layui.address();
		  
	      form.render(); 
	      
	      form.verify({
	    	 pass: [
	    	    /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/
	    	    ,'6-16位字母、数字组成'
	    	  ] ,
	    	  email: function(value, item){ //value：表单的值、item：表单的DOM对象
	    		    if(value!="" &&!new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$").test(value)){
	    		        return '输入的邮箱格式不正确';
	    		      }
	    		    }
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
	.layui-form-select dl dd.layui-this {
	    background-color: #1E9FFF;
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
        <li><a href="#">系统管理</a></li>
        <li><a href="#">新增用户</a></li>
    </ul>
</div>

<div class="formbody" id="tab1">

    <div class="formtitle"><span>基本信息</span></div>
    <form class="layui-form" action="<%= basePath%>biz/SysUser_add.action" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">用户编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userId" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个字母<span id="gradeInfo"></span></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">昵称：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userName" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个汉字</div>
		</div>
  		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userRealName" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个汉字</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码：</label>
			<div class="layui-input-inline">
				<input type="password" name="sysUser.userPassword" lay-verify="required|pass" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>6-16位字母、数字或下滑线组成</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userTelephone" lay-verify="phone" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>11位大陆手机号</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">地址：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userAddress" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过150个汉字</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userEmail" lay-verify="email" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">微信：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userWeixin" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">微博：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userWeibo" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ：</label>
			<div class="layui-input-inline">
				<input type="text" name="sysUser.userQq" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<input name="sysUser.merchantId" id="merchantId" type="hidden"/>
		
		<div class="layui-form-item">
			<label class="layui-form-label">所属单位：</label>
			<div class="layui-input-inline">
				<input placeholder="关键字搜索" type="text" name="name" onkeyup="find()" autocomplete="off" class="layui-input" >
			</div>
			<div id="items" style="top:618px"></div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label" style="font-weight: bold">类别：</label>
		    <div class="layui-input-block ">
		       <input type="radio" name="sysUser.userType" value="3" title="管理公司" checked="checked">
		       <input type="radio" name="sysUser.userType" value="2" title="商家 ">
	           <input type="radio" name="sysUser.userType" value="0" title="用户">
		    </div>
  		</div>
            <div class="layui-form-item">
    		<label class="layui-form-label">角色名称:</label>
			<s:iterator value="roles" id="id">
		    <div class="layui-input-inline">
		      <input name="roleId" id="roleId" type="checkbox" class="dfinput1" value="${roleId}" lay-skin="primary" title="${roleName}"/>
		    </div>
		    </s:iterator>
		  </div>
        <div class="layui-form-item">
	    <label class="layui-form-label"><font style="font-weight: bold">区域:</font></label>
	    <label class="layui-form-label">省(直辖市)：</label>
	    <div class="layui-input-inline">
	    <select name="sysUser.tourProductProvince" lay-filter="province" class="province">  
            <option value="">请选择省</option>  
        </select>  
        </div>
       
	    <label class="layui-form-label">市级：</label>
	     <div class="layui-input-inline">
	       <select name="sysUser.tourProductCity" lay-filter="city" disabled>  
               <option value="">请选择市</option>  
           </select> 
	  	</div>
	  	</div>
		<div class="layui-form-item">
        <div class="layui-input-block">
     	    <button class="scbtn" lay-submit lay-filter="formDemo">立即提交</button>
            <a href="<%= basePath%>/biz/SysUser_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
  		</div>
	</form>
</div>
</body>
</html>
