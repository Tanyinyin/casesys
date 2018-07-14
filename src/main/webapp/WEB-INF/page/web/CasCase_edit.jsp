<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改病人信息</title>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
	<link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css" />
	 <script>
	  //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
	  layui.use(['common','form'], function(){
		  var $ = layui.jquery, common = layui.common,form = layui.form;
	      form.render();  
	  });
	  </script>
</head>
<body>
<div id="edit-form" style="margin: 10px;">
	<form class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label"><span>*</span>就诊时间：</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.visitime" value="${casCase.visitime}" readonly="readonly" autocomplete="off" class="layui-input" lay-verify="required" id="visitTime">
			</div>
		</div>
		<input type="hidden" name="casCase.id" value="${casCase.id}">
		<input type="hidden" name="casCase.patientCode" value="${casCase.patientCode}">
		<div class="layui-form-item">
			<label class="layui-form-label">脈象:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.pulse" value="${casCase.pulse}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">舌质:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.tongueQuality" value="${casCase.tongueQuality}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">舌苔:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.fur" value="${casCase.fur}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">舌体:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.tongue" value="${casCase.tongue}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">六经症状：</label>
			<div class="layui-input-inline">
				<select lay-search name="casCase.sixChannel">
					<option value="">请选择</option>
					<option value="1" <s:if test="casCase.sixChannel==1">selected</s:if>>太阴</option>
					<option value="2" <s:if test="casCase.sixChannel==2">selected</s:if>>少阴</option>
					<option value="3" <s:if test="casCase.sixChannel==3">selected</s:if>>厥阴</option>
					<option value="4" <s:if test="casCase.sixChannel==4">selected</s:if>>太阳</option>
					<option value="5" <s:if test="casCase.sixChannel==5">selected</s:if>>阳明</option>
					<option value="6" <s:if test="casCase.sixChannel==6">selected</s:if>>少阳</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">面部皮肤：</label>
			<div class="layui-input-inline">
				<select lay-search name="casCase.face">
					<option value="">请选择</option>
					<option value="1" <s:if test="casCase.face==1">selected</s:if>>青</option>
					<option value="2" <s:if test="casCase.face==2">selected</s:if>>赤</option>
					<option value="3" <s:if test="casCase.face==3">selected</s:if>>黄</option>
					<option value="4" <s:if test="casCase.face==4">selected</s:if>>白</option>
					<option value="5" <s:if test="casCase.face==5">selected</s:if>>黑</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">咳嗽:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.cough" value="${casCase.cough}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">大便:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.excrement" value="${casCase.excrement}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">小便:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.pee" value="${casCase.pee}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">冷热:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.coldHot" value="${casCase.coldHot}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">汗:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.sweat" value="${casCase.sweat}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">头身:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.headBody" value="${casCase.headBody}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">饮食:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.diet" value="${casCase.diet}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">渴:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.thirsty" value="${casCase.thirsty}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">耳:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.ear" value="${casCase.ear}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">耳油:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.earOil" value="${casCase.earOil}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">月经:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.menstruation" value="${casCase.menstruation}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">肝功能:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.liverFunction" value="${casCase.liverFunction}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">肾功能:</label>
			<div class="layui-input-inline">
				<input type="text" name="casCase.renalFunction" value="${casCase.renalFunction}" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">血常规：</label>
			<div class="layui-input-block">
				<textarea name="casCase.bloodRoutine" value="${casCase.bloodRoutine}" placeholder="请输入血常规" class="layui-textarea"></textarea>
			</div>
		</div>
	</form>
</div>
</body>
</html>

