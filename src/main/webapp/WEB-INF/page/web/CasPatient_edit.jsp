<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改病人信息</title>
	<script type="text/javascript" src="<%=basePath %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/select.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css" />
	  <script>
	  //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	  layui.use(['common','form'], function(){
		  var $ = layui.jquery, common = layui.common,form = layui.form;
	      form.render();  
	      form.on('submit(casPatient)', function(data){
	    	   // layer.msg(JSON.stringify(data.field));
	        return true;
	      });
	  });
	  </script>
	  <style type="text/css">
	
	  .layui-form-radioed i, .layui-form-radio i:hover {
	    color: #1E9FFF;
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
			<li><a href="#">病人管理</a></li>
			<li><a href="#">修改基本信息</a></li>
		</ul>
	</div>
    <div class="formbody" id="tab1">
    <div class="formtitle"><span>修改基本信息</span></div>
    <form class="layui-form" action="<%= basePath%>biz/CasPatient_update.action" method="post">
    	<input type="hidden" name="casPatient.patientCode" value="${casPatient.patientCode}"  autocomplete="off" class="layui-input" >
		<div class="layui-form-item">
			<label class="layui-form-label">病人姓名：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientName" value="${casPatient.patientName}"  autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item" >
		    <label class="layui-form-label">性别：</label>
		    <div class="layui-input-block ">
		    <s:if test="casPatient.patientSex==0"> 
				<input type="radio" name="casPatient.patientSex" title="男&nbsp;&nbsp;&nbsp;" checked value="0" />
				<input type="radio" name="casPatient.patientSex" title="女&nbsp;&nbsp;&nbsp;" value="1" />
				</s:if>
		      <s:else> 
				<input type="radio" name="casPatient.patientSex" title="男&nbsp;&nbsp;&nbsp;" value="0" />
				<input type="radio" name="casPatient.patientSex" title="女&nbsp;&nbsp;&nbsp;" checked value="1" />
			  </s:else>
		    </div>
  		</div>
  		<div class="layui-form-item">
			<label class="layui-form-label">年龄：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientAge" value="${casPatient.patientAge}"  autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">民族：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientNation" value="${casPatient.patientNation}"  autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item" >
		    <label class="layui-form-label">婚姻状况：</label>
		    <s:if test="casPatient.patientMarriage==1"> 
			        <input name="casPatient.patientMarriage" type="radio" class="dfradio" value="1" title="已婚"/>
				    <input name="casPatient.patientMarriage" type="radio" class="dfradio" value="0" title="未婚"/>
			</s:if>
			<s:else> 
					<input name="casPatient.patientMarriage" type="radio" class="dfradio" value="1" title="已婚"/>
					<input name="casPatient.patientMarriage" type="radio" class="dfradio" checked value="0" title="未婚"/>	
			</s:else>
  		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">出生地：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientBirthplace" value="${casPatient.patientBirthplace}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">职业：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientJob" value="${casPatient.patientJob}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式：</label>
			<div class="layui-input-inline">
				<input type="text" name="casPatient.patientPhone" value="${casPatient.patientPhone}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
        <div class="layui-input-block">
     	    <button class="scbtn" lay-submit lay-filter="casPatient">立即提交</button>&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="<%= basePath%>/biz/CasPatient_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
  		</div>
	</form>
    </div>
</body>
</html>