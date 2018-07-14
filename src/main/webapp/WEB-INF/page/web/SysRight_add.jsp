<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>角色权限-新增</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=path %>/third/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script>
        var  _contextPath="<%=path%>";
        var  _modulePath=_contextPath+"/sys/";

        $(document).ready(function(e) {
            $(".btn").click(function(){
                _sbmForm(_modulePath+"textures_add.action?view=list","");
                });
            
                $(".cancel").on('click',function(){
                    window.location.href = "<%= basePath%>/biz/SysRight_list.action";
                });
        });
    </script>
    <!-- 验证权限编号是否已存在 -->
    <script type="text/javascript">
        $(function(){
            var url = "/front/SysJson_checkRightName.action";
            $("#rightId").blur(function(){//给角色编号添加失去焦点事件
                var id = $("input[name='rightId']").val();//获取角色编号值
                $.post(url,{"checkName":id},function(data){//发送请求验证角色编号
                    if(data == "no"){//如果返回 no,提示已存在
                        $("#gradeInfo").html("<font color=\"red\">您输入的编号存在！请重新输入！</font>");
                    }else{//否则隐藏
                        $("#gradeInfo").hide();
                    }
                },"json");
            });
        });
    </script>
    <script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src="<%= basePath%>third/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(function(){
			
			//如果是新增成功，会返回1，如果是1，则提示保存成功
			if("1" == "${actionState}"){
				alert('保存成功！');
			}
			
            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
                onkeyup: false,   
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
					checkFrom();
                    form.submit();   //提交表单   
                },   
                rules:{
                    "rightId":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "rightName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "rightType":{
                        required:true,
                        digits:true,
                        rangelength:[1,4] 
                    },
                    "rightSortOrder":{
                        required:true,
                        digits:true,
                        rangelength:[1,4]
                    }
                },
                messages:{
                    "rightId":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightName":{
                        required:"必填",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightType":{
                        required: "必填",
                        digits:"请输入整数",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "rightSortOrder":{
                        required: "必填",
                        digits:"请输入整数",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                  }
            });    
        });
    </script>
    <style type="text/css">

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
    <li><a href="#">新增权限</a></li>
    </ul>
    </div>
    <div class="formtitle"><span>权限信息</span></div>
    <form class="layui-form" action="<%= basePath%>/biz/SysRight_add.action" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">权限编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="rightId" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font><span id="gradeInfo"></span></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">权限名称：</label>
			<div class="layui-input-inline">
				<input type="text" name="rightName" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>不能超过20个汉字</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">资源路径：</label>
			<div class="layui-input-inline">
				<input type="text" name="resourcePath"  lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font><span id="gradeInfo"></span></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">权限类别：</label>
			<div class="layui-input-inline">
				<input type="text" name="rightType" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>1-4位整数</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">排序序号：</label>
			<div class="layui-input-inline">
				<input type="text" name="rightSortOrder" lay-verify="required" autocomplete="off" class="layui-input" >
			</div>
			<div class="layui-form-mid layui-word-aux"><font color="#FF0000">*必填</font>1-4位整数</div>
		</div>
		<div class="layui-form-item">
        <div class="layui-input-block">
     	    <button class="scbtn" lay-submit lay-filter="formDemo">确认保存</button>
            <a href="<%= basePath%>/biz/SysRight_list.action" class="layui-btn layui-btn-primary">取消</a>
    	</div>
  		</div>
	</form>
    

</body>

</html>
