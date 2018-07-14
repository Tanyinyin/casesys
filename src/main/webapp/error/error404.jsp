<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>系统出现异常</title>
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>

	<script type="text/javascript">
		$(function(){
		    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
			$(window).resize(function(){  
		    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	    })  
	});  
	</script> 
</head>
<body style="background:#edf6fa;">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">404错误提示</a></li>
    </ul>
    </div>
    
    <div class="error">
    
    <h2>非常遗憾，您访问的页面不存在！</h2>
    <div class="reindex"><div class="reindex"><a href="<%=basePath%>/front/Login_openIndex.action" target="rightFrame">返回首页</a></div></div>
    
    </div>


</body>

</html>
