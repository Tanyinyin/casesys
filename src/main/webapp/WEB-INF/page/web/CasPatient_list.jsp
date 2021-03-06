<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>病人列表</title>
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
			var patientCode = $(this).attr("patientCode");
			url = "<%=basePath%>/biz/CasPatient_delete.action?patientCode=" + patientCode;$(".tip").fadeIn(200);});
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

            $(".add-patient").on('click',function(){
                window.location.href = "<%= basePath%>/biz/CasPatient_openAdd.action";
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
			<li><a href="#">病例管理</a></li>
			<li><a href="#">病人管理</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab2" class="tabson">
				<form action="<%=basePath%>/biz/CasPatient_list.action"
					method="post" target="rightFrame">
					<ul class="seachform">
						<li><label>病人姓名：</label><input class="scinput"
							name="casPatient.patientName"  /></li>
						<li><label>病人民族：</label><input class="scinput"
							name="casPatient.patientNation"/></li>
						<li><input name="" type="submit" class="scbtn" value="查询" /></li>
						<li class="clickk"><span><img src="<%=path%>/images/t01.png"/></span><a
                                href="<%= basePath%>/biz/CasPatient_openAdd.action">添加病人</a></li>
					</ul>
					
				</form>
				
				<table class="tablelist">
					<thead>
						<tr>

							<th><input name="" type="checkbox" value=""
								checked="checked" /></th>
							<th>序号<i class="sort"><img src="<%=path%>/images/px.gif" /></i></th>
							<th>病人编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>民族</th>
							<th>婚姻状况</th>
							<th>出生地</th>
							<th>职业</th>
							<th>联系方式</th>
							<p:permissions menu="deleteUser,editUser">
								<th>操作</th>
							</p:permissions>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageResult.data" status="status" var="patient">

							<tr>

								<td><input name="" type="checkbox" value="" /></td>
								<td><s:property value="#status.index+1" /></td>
								<td>${patientCode}</td>
								<td>${patientName}</td>
								<td><s:if test="#patient.patientSex==0"> 男</s:if>
									<s:else>女</s:else></td>
								<td>${patientAge}</td>
								<td>${patientNation}</td>
								<td><s:if test="#patient.patientMarriage==1">已婚</s:if> <s:else>未婚</s:else></td>
								<td>${patientBirthplace}</td>
								<td>${patientJob}</td>
								<td>${patientPhone}</td>
								<td><a href="<%= basePath%>/biz/CasPatient_openEdit.action?patientCode=${patientCode}" class="tablelink">修改</a>&nbsp;&nbsp;
									<a href="javascript:;" class="tablelinkdelete" style="color: red" patientCode="${patientCode}"> 删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

			</div>

		</div>
		<%
			//查询的url地址，统一写
			String listActionURL = basePath + "/biz/CasPatient_list.action";
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
var url = "<%=basePath%>/biz/SysUser_list.action"; //获取表单url
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
		<%--<script type="text/javascript">--%>
			<%--$("#usual1 ul").idTabs();--%>
		<%--</script>--%>

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