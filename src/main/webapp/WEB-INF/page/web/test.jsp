<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>病例管理</title>
	<link href="<%=path%>/css/style.css?v=2018040301" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/select.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/third/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">病例管理</a></li>
		</ul>
	</div>
	<div class="main">
		<blockquote class="layui-elem-quote">病人基本信息</blockquote>
		<button type="button" class="layui-btn" id="test1">
			<i class="layui-icon">&#xe67c;</i>上传图片
		</button>
	</div>
	<script>
        //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element','common','upload','form'], function(){
            var $ = layui.jquery, form = layui.form,upload = layui.upload;

            //执行实例
            upload.render({
                elem: '#test1' //绑定元素
                ,url: '<%=basePath%>bizJson/Test_upload.action' //上传接口
                ,done: function(res){
                    //上传完毕回调
                }
                ,error: function(){
                    //请求异常回调
                }
            });
            //绑定操作按钮
            $('.operator-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
	</script>
</body>
</html>