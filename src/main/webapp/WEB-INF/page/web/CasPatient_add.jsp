<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
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
	<style type="text/css">
	
	.layui-form-radioed i, .layui-form-radio i:hover {
	color: #1E9FFF;
	}
   .layui-btn-primary:hover {
    border-color: #ddd;
    color: #333;
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
    

	</style>

</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">病例管理</a></li>
		    <li><a href="#">新增病人</a></li>
	    </ul>
    </div>
    <div class="formbody" id="tab1">
    <div class="formtitle"><span>基本信息</span></div>
    <form class="layui-form" action="<%= basePath%>biz/CasPatient_add.action" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">病人姓名：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientName" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">性别：</label>
		    <div class="layui-input-block ">
		      <input type="radio"  name="casPatient.patientSex" value="0" title="男&nbsp;&nbsp;&nbsp;" checked>
		      <input type="radio"  name="casPatient.patientSex" value="1" title="女&nbsp;">
		    </div>
  		</div>
  		<div class="layui-form-item">
			<label class="layui-form-label">年龄：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientAge" lay-verify="number" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">民族：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientNation" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>			
		</div>
		<div class="layui-form-item"  pane>
		    <label class="layui-form-label">婚姻状况：</label>
		    <div class="layui-input-block">
		      <input type="radio" name="casPatient.patientMarriage" value="0" title="未婚" checked>
		      <input type="radio" name="casPatient.patientMarriage" value="1" title="已婚">
		    </div>
  		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">出生地：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientBirthplace" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">职业：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientJob" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>			
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientPhone" lay-verify="phone" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font></div>			
		</div>
		<div class="layui-form-item">
        <div class="layui-input-block">
     	    <button class="scbtn" lay-submit lay-filter="formDemo">立即提交</button>&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="<%= basePath%>/biz/CasPatient_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
  		</div>
	</form>
    </div>
    <script type="text/javascript">
		layui.use(['common','form'], function(){
    		
    	});
    </script>
</body>
</html>