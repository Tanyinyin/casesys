<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>处方管理</title>
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/js/common.js"></script>
	<script type="text/javascript">
		/*
		 *_contextPath:上下文路径
		 *_modulePath: 模块路径
		 */
		var  _contextPath="<%=path%>";
		var  _modulePath=_contextPath+"/sys/";
		$(document).ready(function(){
		  $(".clicks").click(function(){
		   _open(_modulePath+"textures_open.action?view=add");
		  });
		});
	</script>
	<!--  -->
	<script type="text/javascript">
		//删除
		$(document).ready(function(){
				var url ;
				$(".tablelinkdelete").click(function(){
				var id = $(this).attr("id");
				url = "<%=basePath%>/biz/CasPrescription_delete.action?id=" + id;$(".tip").fadeIn(200);});
							$(".tiptop a").click(function() {
								$(".tip").fadeOut(200);
							});

							$(".sure").click(function() {
								$(".tip").fadeOut(100);
								window.location.href = url;
							});

							$(".cancel").click(function() {
								$(".tip").fadeOut(100);
							});

						});
	</script>
	<style type="text/css">
		.tablelinkdelete {
			color: #056dae;
		}

		.find {
			height: 31px;
			margin-top: -5px;
			margin-left: -10px;
		}

		.find1 {
			height: 31px;
			margin-right: -14px;
			margin-top: -5px;
		}
	</style>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">数据字典</a></li>
			<li><a href="#">处方管理</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">
				<form action="<%=basePath%>/biz/CasPrescription_list.action"
					method="post" target="rightFrame">
					<ul class="seachform">
						<li><label>处方名称：</label><input class="scinput"
							name="casPrescription.prescriptionName"  /></li>
						<li><input name="" type="submit" class="scbtn" value="查询" /></li>
						<li class="clickk"><span><img src="<%=path%>/images/t01.png"/></span>
						<a href="<%= basePath%>/biz/casPrescription_openMessage.action">添加处方</a></li>
					</ul>
				</form>
					
				
				<table class="tablelist">
					<thead>
						<tr>

							<th><input name="" type="checkbox" value="" checked="checked" /></th>
							<th>序号<i class="sort"><img src="<%=path%>/images/px.gif" /></i></th>
							<th>处方名称</th>
							<th>操作</th>

						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageResult.data" status="status" var="patient">

							<tr>
								<td><input name="" type="checkbox" value="" /></td>
								<td><s:property value="#status.index+1" /></td>
							
								<td>${prescriptionName}</td>
							    <td><a href="javascript:;" class="tablelinkdelete" style="color: red" id="${id}"> 删除</a></td></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

			</div>

		</div>
		<%
			//查询的url地址，统一写
			String listActionURL = basePath + "/biz/CasPrescription_list.action";
		%>

		<script type="text/javascript">
//分页组件
function change()
  {
 	var textfield=document.getElementById("textfield").value;
 	var totalPage=document.getElementById("totalPage").value;
 	var pageNum = 0;
 	if(textfield < totalPage ){
 		pageNum = textfield; 
 		window.location.href="<%=listActionURL%>?page="+pageNum;
 	}else{
 		pageNum = totalPage; 
 		alert("当前只有"+totalPage+"页");
 	}
  	
  }
</script>
		<script type="text/javascript">
var url = "<%=basePath%>
			/biz/CasPrescription_list.action"; //获取表单url
			//首页
			function first() {

				window.location.href = url + "?page=1";
			}
			//上一页
			function previous() {
				window.location.href = url
						+ "?page=${pageResult.previousPageNumber}";
			}
			//下一页
			function next() {
				window.location.href = url
						+ "?page=${pageResult.nextPageNumber}";
			}
			//尾页
			function last() {
				window.location.href = url + "?page=${pageResult.totalPage}";
			}
		</script>
		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageResult.total}</i>条记录 <i class="blue">${pageResult.totalPage}</i>页，
				当前显示第&nbsp;<i class="blue">${pageResult.page}</i>页
			</div>
			<ul class="paginList">
				<c:choose>
					<c:when test="${pageResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">首页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:first()"
							target="rightFrame">首页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.isFirst==true}">
						<li class="paginItem current"><a href="javascript:;">上一页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:previous()"
							target="rightFrame">上一页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.hasNext==true}">
						<li class="paginItem"><a href="javascript:next()"
							target="rightFrame">下一页&nbsp;</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem current"><a href="javascript:;">下一页</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageResult.isLast==true}">
						<li class="paginItem current"><a href="javascript:;">尾页</a></li>
					</c:when>
					<c:otherwise>
						<li class="paginItem"><a href="javascript:last()"
							target="rightFrame">尾页&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
				<li class="paginItem-page">跳转到：&nbsp; <input name="textfield"
					type="text" size="4" class="page-input" id="textfield"
					onchange="change()" />&nbsp;页
				</li>
			</ul>
		</div>
		<!-- 分页菜单组件--------------------------结束 -->
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>

		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>

	<div class="tip">
		<div class="tiptop">
			<span>提示信息</span><a></a>
		</div>
		<div class="tipinfo">
			<span><img src="<%=basePath%>images/ticon.png" /></span>
			<div class="tipright">
				<p>是否确认删除信息 ？</p>
				<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; <input
				name="" type="button" class="cancel" value="取消" />
		</div>

	</div>
</body>
</html>