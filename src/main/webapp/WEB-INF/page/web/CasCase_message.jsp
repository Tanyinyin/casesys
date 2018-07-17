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
	<style type="text/css">
		.main {
			margin: 15px;
			width: auto;
		}
		.main .layui-elem-quote {
			padding: 8px;
		    border-left: 5px solid #3eafe0;
		}
		.layui-layer-btn1 {
			background-color: gray;
		}
		.layui-layer-btn a {
    		background-color: #cecaca;
		}
		.forminfo {
			overflow: hidden;
			margin-bottom: 10px;
		}
		.forminfo li {
			color: #898e93;
		}
		.main .patient-msg span, .case-msg ul.forminfo  span {
			minWidth: 86px;
			line-height: 34px;
			display: block;
			float: left;
			margin-right: 21px;
		}
		.layui-elem-quote .layui-btn-sm {
			height: 23px;
			line-height: 23px;
			padding: 0 10px;
			font-size: 12px;
		}
		.forminfo li label{    
		    width: 60px;
		    text-align: right;
		    line-height: 34px;
		    display: block;
		    float: left;
	    }
		#add-form .layui-form-label span {
			color:  red;
		}
		.layui-form-select dl dd.layui-this {
   		background-color: #1E9FFF;
    	color: #fff;
		}
		.layui-layer-btn1{
	    height: 28px;
	    line-height: 28px;
	    margin: 5px 5px 0;
	    padding: 0 15px;
	    border: 1px solid #dedede;
	    background-color: #ddd !important;
	    color: #333;
	    border-radius: 2px;
	    font-weight: 400;
	    cursor: pointer;
	    text-decoration: none;
		}
		.layui-layer-btn .layui-layer-btn0 {
	    width: 45px;
	    height: 30px;
	    background: url(../images/btnbg.png) no-repeat center;
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    cursor: pointer;
	    border-radius: 3px;
	    behavior: url(js/pie.htc);
	    text-align: center;
		}
		.layui-layer-btn a {
		width: 45px;
	    height: 30px;
	    line-height: 32px;
	    border: 1px solid #ddd;
	    background-color: #ddd;
	    font-size: 14px;
	    font-weight: bold;
	    cursor: pointer;
	    border-radius: 3px;
	    text-align: center;
	    }
	    .layui-btn-primary:hover {
	    border-color: #C9C9C9;
	    color: #333;
		}
	</style>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
</head>
<%@include file="CasCase_add.jsp"%>
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
		<div class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">病人名称：</label>
				<div class="layui-input-inline">
					<select lay-search class="patient-name" lay-filter="patientName">
					</select>
				</div>
			</div>
		</div>
		<div class="patient-msg">
			<ul class="forminfo">
				<li class="patient-text">
					
				</li>
			</ul>
		</div>
		<blockquote class="layui-elem-quote">病例信息<a class="layui-btn layui-btn-sm layui-btn layui-btn-primary operator-btn" data-type="add" style="float: right;"><img src="/CasesSys/images/t01.png" style="width: 16px;height: 16px;"/>添加病例</a></blockquote>
	<!-- 	 -->
<!--  <a class="layui-btn layui-btn-sm layui-btn-normal operator-btn" data-type="add" style="float: right;" >添加</a> -->
<!-- <li class="clickk"><span><img src="/CasesSys/images/t01.png"></span>
						<a href="http://127.0.0.1:8080/CasesSys//biz/CasCase_openMessage.action">添加病例</a></li> -->
		<div class="case-msg">
			<div class="layui-collapse">

			</div>
		</div>
	</div>
	<script>
        layui.use(['element','common','laydate','form','util'], function(){
            
        	var $ = layui.jquery, element = layui.element,common = layui.common,laydate = layui.laydate,form = layui.form;
            laydate.render({elem: '#visitTime',type:'datetime'})
            let code = '${casPatient.patientCode}';
            //let code = ${casPatient.patientCode};
            //let Code = ${patientCode};
            // 异步 post请求 （get/post） $.post(url,{id:content},function(res){})
            $.post("<%=basePath%>bizJson/CasPatient_patientList.action",
            		{patientCode:code},function(res){
            	let html = "<option value=''>请选择</option>";
            	layui.each(res.data,function(i,j){
            		if (j.patientCode == code) {
            			html += "<option value='"+j.patientCode+"' selected>"+j.patientName+"</option>"
            		} else {
            			html += "<option value='"+j.patientCode+"'>"+j.patientName+"</option>"
            		}
            		
            	})
            	$(".patient-name").empty().append(html);
            	form.render(); // 框架 渲染
            });       
            $.post("<%=basePath%>bizJson/CasPatient_getPatient.action",{patientCode:code},function(res){
        		let casPatient = res.data;
            	let html = "<label>病人编号：</label><span class='patientCode'>"+casPatient.patientCode+"</span> "
            		+"<label>病人姓名：</label><span style='font-weight:bold;color: black;font-size: 15px;'>"+casPatient.patientName+"</span>"
					+"<label>性别：</label><span>"
					if(casPatient.patientSex == 0){
						html += "男";  				
					} else if (casPatient.patientSex == 1){
						html += "女";
					}
					html+="</span>"
					html+="<label>年龄：</label><span>${casPatient.patientAge}</span><label>民族：</label><span>"+casPatient.patientNation+"</span>"
					html+="<label>婚姻状况：</label><span>"
					if(casPatient.patientMarriage == 0){
						html += "未婚";  				
					} else if (casPatient.patientMarriage == 1){
						html += "已婚";
					}
					html+="</span>"
					html+="<label>职业：</label><span>${casPatient.patientJob}</span><label>联系方式：</label><span>"+casPatient.patientPhone+"</span>"
					html+="<label>出生地：</label><span>"+casPatient.patientBirthplace+"</span>"
					$(".patient-text").empty().append(html);
            });
            $.post("<%=basePath%>bizJson/CasCase_list.action",{patientCode:code},function(res){
                if (res.code != 0) {
                	 $(".layui-collapse").html(res.msg);
                	 return;
                }
            	let html = "";
                layui.each(res.data,function (i,j) {
                    let index = i + 1;
                    let time = layui.util.toDateString(j.visitime);
                    html += "<div class=\"layui-colla-item\">\n" +
                        "\t\t\t\t\t<h2 class=\"layui-colla-title\">病例"+index+"：<span>"+time+"</span><div style=\"float: right;\"><a class=\"tablelink operator-btn\" data-type=\"edit\" data-info="+j.id+">修改</a>&nbsp;"+
						"<a href=\"javascript:;\" class=\"tablelinkdelete operator-btn\" style=\"color: red\" data-type=\"tablelinkdelete\" data-info="+j.id+"> 删除</a></div></h2>\n"+
						/* "<a href=\"javascript:;\" class=\"tablelinkdelete operator-btn\" style=\"color: red\" data-type=\"tablelinkdelete\" data-info="+j.id+"> 删除</a></div></h2>\n"+ */
						"\t\t\t\t\t<div class=\"layui-colla-content\">\n" +
                        "\t\t\t\t\t\t<ul class=\"forminfo\">\n" +
                        "\t\t\t\t\t\t\t<li><label>就诊时间：</label><span>"+j.visitime+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>脈象：</label><span>"+j.pulse+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>舌质：</label><span>"+j.tongueQuality+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>舌苔：</label><span>"+j.fur+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>舌体：</label><span>"+j.tongue+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>六经症状：</label>\n"+
                        "\t\t\t\t\t\t\t\t<span>\n" ;
                    if (j.sixChannel == 1) {
                        html += "太阴";
                    } else if (j.sixChannel == 2) {
                        html += "少阴";
                    } else if (j.sixChannel == 3){
                        html += "厥阴";
                    } else if (j.sixChannel == 4) {
                        html += "太阳";
                    } else if (j.sixChannel == 5){
                        html += "阳明";
                    } else if (j.sixChannel == 6) {
                        html += "少阳";
                    }
                    html += "\t\t\t\t\t\t\t\t</span>\n" +
                        "\t\t\t\t\t\t\t<li><label>面部皮肤：</label>\n" +
                        "\t\t\t\t\t\t\t\t<span>\n" ;
                    if (j.face == 1) {
                        html += "青";
                    } else if (j.face == 2) {
                        html += "赤";
                    } else if (j.face == 3){
                        html += "黄";
                    } else if (j.face == 4) {
                        html += "白";
                    } else if (j.face == 5) {
                        html += "黑";
                    }
                    html += "\t\t\t\t\t\t\t\t</span>\n" +
                        "\t\t\t\t\t\t\t</li>\n" +
                        "\t\t\t\t\t\t\t<li><label>咳嗽：</label><span>"+j.cough+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>大便：</label><span>"+j.excrement+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>小便：</label><span>"+j.pee+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>冷热：</label><span>"+j.coldHot+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>汗：</label><span>"+j.sweat+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>头身：</label><span>"+j.headBody+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>饮食：</label><span>"+j.diet+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>渴：</label><span>"+j.thirsty+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>耳：</label><span>"+j.ear+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>耳油：</label><span>"+j.earOil+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>月经：</label><span>"+j.menstruation+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>肝功能：</label><span>"+j.liverFunction+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>肾功能：</label><span>"+j.renalFunction+"</span></li>\n" +
                        "\t\t\t\t\t\t\t<li><label>血常规：</label><span>"+j.bloodRoutine+"</span></li>\n" +
                        "\t\t\t\t\t\t</ul>\n" +
                        "\t\t\t\t\t</div>\n" +
                        "\t\t\t\t</div>"
                })
                $(".layui-collapse").empty().append(html);
                element.init('collapse');// 重新初始化 collapse
            })
            // 监听选择病人下拉框
            form.on('select(patientName)', function(data){
            	let patientCode = data.value;
            	$.post("<%=basePath%>bizJson/CasPatient_getPatient.action",{patientCode:patientCode},function(res){
            		let casPatient = res.data;
                	let html = "<label>病人编号：</label><span class='patientCode'>"+casPatient.patientCode+"</span> "
                		+"<label>病人姓名：</label><span style='font-weight:bold;color: black;font-size: 15px;'>"+casPatient.patientName+"</span>"
    					+"<label>性别：</label><span>"
    					if(casPatient.patientSex == 0){
    						html += "男";  				
    					} else if (casPatient.patientSex == 1){
    						html += "女";
    					}
    					html+="</span>"
    					html+="<label>年龄：</label><span>${casPatient.patientAge}</span><label>民族：</label><span>"+casPatient.patientNation+"</span>"
    					html+="<label>婚姻状况：</label><span>"
    					if(casPatient.patientMarriage == 0){
    						html += "未婚";  				
    					} else if (casPatient.patientMarriage == 1){
    						html += "已婚";
    					}
    					html+="</span>"
    					html+="<label>职业：</label><span>${casPatient.patientJob}</span><label>联系方式：</label><span>"+casPatient.patientPhone+"</span>"
    					html+="<label>出生地：</label><span>"+casPatient.patientBirthplace+"</span>"
   					$(".patient-text").empty().append(html);
                });
            	//获取病例信息
            	$.post("<%=basePath%>bizJson/CasCase_list.action",{patientCode:patientCode},function(res){
                    if (res.code != 0) {
                    	 $(".layui-collapse").html(res.msg);
                    	 return;
                    }
                	let html = "";
                    layui.each(res.data,function (i,j) {
                        let index = i + 1;
                        let time = layui.util.toDateString(j.visitime);
                        html += "<div class=\"layui-colla-item\">\n" +
                            "\t\t\t\t\t<h2 class=\"layui-colla-title\">病例"+index+"：<span>"+time+"</span><div style=\"float: right;\"><a class=\"tablelink operator-btn\" data-type=\"edit\" data-info="+j.id+">修改</a>&nbsp;"+
                            "<a href=\"javascript:;\" class=\"tablelinkdelete operator-btn\" style=\"color: red\" data-type=\"tablelinkdelete\" data-info="+j.id+"> 删除</a></div></h2>\n"+        
                            "\t\t\t\t\t<div class=\"layui-colla-content\">\n" +
                            "\t\t\t\t\t\t<ul class=\"forminfo\">\n" +
                            "\t\t\t\t\t\t\t<li><label>就诊时间：</label><span>"+j.visitime+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>脈象：</label><span>"+j.pulse+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>舌质：</label><span>"+j.tongueQuality+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>舌苔：</label><span>"+j.fur+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>舌体：</label><span>"+j.tongue+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>六经症状：</label>\n" +
                            "\t\t\t\t\t\t\t\t<span>\n" ;
                        if (j.sixChannel == 1) {
                            html += "太阴";
                        } else if (j.sixChannel == 2) {
                            html += "少阴";
                        } else if (j.sixChannel == 3){
                            html += "厥阴";
                        } else if (j.sixChannel == 4) {
                            html += "太阳";
                        } else if (j.sixChannel == 5){
                            html += "阳明";
                        } else if (j.sixChannel == 6) {
                            html += "少阳";
                        }
                        html += "\t\t\t\t\t\t\t\t</span>\n" +
                            "\t\t\t\t\t\t\t<li><label>面部皮肤：</label>\n" +
                            "\t\t\t\t\t\t\t\t<span>\n" ;
                        if (j.face == 1) {
                            html += "青";
                        } else if (j.face == 2) {
                            html += "赤";
                        } else if (j.face == 3){
                            html += "黄";
                        } else if (j.face == 4) {
                            html += "白";
                        } else if (j.face == 5) {
                            html += "黑";
                        }
                        html += "\t\t\t\t\t\t\t\t</span>\n" +
                            "\t\t\t\t\t\t\t</li>\n" +
                            "\t\t\t\t\t\t\t<li><label>咳嗽：</label><span>"+j.cough+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>大便：</label><span>"+j.excrement+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>小便：</label><span>"+j.pee+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>冷热：</label><span>"+j.coldHot+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>汗：</label><span>"+j.sweat+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>头身：</label><span>"+j.headBody+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>饮食：</label><span>"+j.diet+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>渴：</label><span>"+j.thirsty+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>耳：</label><span>"+j.ear+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>耳油：</label><span>"+j.earOil+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>月经：</label><span>"+j.menstruation+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>肝功能：</label><span>"+j.liverFunction+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>肾功能：</label><span>"+j.renalFunction+"</span></li>\n" +
                            "\t\t\t\t\t\t\t<li><label>血常规：</label><span>"+j.bloodRoutine+"</span></li>\n" +
                            "\t\t\t\t\t\t</ul>\n" +
                            "\t\t\t\t\t</div>\n" +
                            "\t\t\t\t</div>"
                    })
                    $(".layui-collapse").empty().append(html);
                    element.init('collapse');// 重新初始化 collapse
                })
           	});  
            var active = {
                add: function () {
                    common.addForm({
						content: $('#add-form'),
						area:['800px','500px'],
						title:'添加病例',
                        yes: function (index, layero) {
                            var formEm = $(layero).find("form");
                            if (!form.onVerify(formEm)){
                                return false;
                            }
                            /**表单提交 **/
                            $.post('<%=basePath%>/bizJson/CasCase_add.action', formEm.serialize(), function(result){
                                if(result.code == 0){
                                    formEm[0].reset();	//清空弹框表单内容
                                    layer.close(index);	//关闭弹框
                                    active.getCases()
                                    return;
                                }
                                layer.msg(result.msg);
                            });
                        }
					})
                },
                edit: function (id) {
                    common.editForm({
						content: "<%= basePath%>/biz/CasCase_openEdit.action?id="+id,
						area:['800px','500px'],
						title:'修改病例',
                        yes: function (index, layero) {
                        	var formEm = $(layero).find('iframe').contents().find('form');
                            if (!form.onVerify(formEm)){
                                return false;
                            }
                            /**表单提交 **/
                            $.post('<%=basePath%>/bizJson/CasCase_update.action', formEm.serialize(), function(result){
                                if(result.code == 0){
                                	formEm[0].reset();	//清空弹框表单内容
                                    layer.close(index);	//关闭弹框
                                    active.getCases()
                                    return;
                                }
                                layer.msg(result.msg);
                            });
                        }
					})
                },
              tablelinkdelete: function(id){
        			$(".tablelinkdelete").click(function(){
        				$(".tip").fadeIn(200);});
        						$(".tiptop a").click(function() {
        							$(".tip").fadeOut(200);
        						});

        						$(".sure").click(function() {
        							$(".tip").fadeOut(100);
        							$.post('<%=basePath%>/bizJson/CasCase_delete.action',{id:id}, function(result){
        	                     		if(result.code == 0){
        	                                 active.getCases()
        	                                 return;
        	                     		}
        	                	    });
        						});

        						$(".cancel").click(function() {
        							$(".tip").fadeOut(100);
        						});
                     		}, 
                getCases: function () {
                    $.post("<%=basePath%>bizJson/CasCase_list.action",{patientCode:$('.patientCode').text()},function(res){
                        let html = "";
                        layui.each(res.data,function (i,j) {
                            let index = i + 1;
                            let time = layui.util.toDateString(j.visitime);
                            html += "<div class=\"layui-colla-item\">\n" +
                            "\t\t\t\t\t<h2 class=\"layui-colla-title\">病例"+index+"：<span>"+time+"</span><div style=\"float: right;\"><a class=\"tablelink operator-btn\" data-type=\"edit\" data-info="+j.id+">修改</a>&nbsp;"+
                            "<a href=\"javascript:;\" class=\"tablelinkdelete operator-btn\" style=\"color: red\" data-type=\"tablelinkdelete\" data-info="+j.id+"> 删除</a></div></h2>\n"+        
                            "\t\t\t\t\t<div class=\"layui-colla-content\">\n" +
                            "\t\t\t\t\t\t<ul class=\"forminfo\">\n" +
                                "\t\t\t\t\t\t\t<li><label>就诊时间：</label><span>"+time+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>脈象：</label><span>"+j.pulse+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>舌质：</label><span>"+j.tongueQuality+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>舌苔：</label><span>"+j.fur+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>舌体：</label><span>"+j.tongue+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>六经症状：</label>\n" +
                                "\t\t\t\t\t\t\t\t<span>\n" ;
                            if (j.sixChannel == 1) {
                                html += "太阴";
                            } else if (j.sixChannel == 2) {
                                html += "少阴";
                            } else if (j.sixChannel == 3){
                                html += "厥阴";
                            } else if (j.sixChannel == 4) {
                                html += "太阳";
                            } else if (j.sixChannel == 5){
                                html += "阳明";
                            } else if (j.sixChannel == 6) {
                                html += "少阳";
                            }
                            html += "\t\t\t\t\t\t\t\t</span>\n" +
                                "\t\t\t\t\t\t\t<li><label>面部皮肤：</label>\n" +
                                "\t\t\t\t\t\t\t\t<span>\n" ;
                            if (j.face == 1) {
                                html += "青";
                            } else if (j.face == 2) {
                                html += "赤";
                            } else if (j.face == 3){
                                html += "黄";
                            } else if (j.face == 4) {
                                html += "白";
                            } else if (j.face == 5) {
                                html += "黑";
                            }
                            html += "\t\t\t\t\t\t\t\t</span>\n" +
                                "\t\t\t\t\t\t\t</li>\n" +
                                "\t\t\t\t\t\t\t<li><label>咳嗽：</label><span>"+j.cough+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>大便：</label><span>"+j.excrement+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>小便：</label><span>"+j.pee+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>冷热：</label><span>"+j.coldHot+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>汗：</label><span>"+j.sweat+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>头身：</label><span>"+j.headBody+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>饮食：</label><span>"+j.diet+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>渴：</label><span>"+j.thirsty+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>耳：</label><span>"+j.ear+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>耳油：</label><span>"+j.earOil+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>月经：</label><span>"+j.menstruation+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>肝功能：</label><span>"+j.liverFunction+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>肾功能：</label><span>"+j.renalFunction+"</span></li>\n" +
                                "\t\t\t\t\t\t\t<li><label>血常规：</label><span>"+j.bloodRoutine+"</span></li>\n" +
                                "\t\t\t\t\t\t</ul>\n" +
                                "\t\t\t\t\t</div>\n" +
                                "\t\t\t\t</div>"
                        })
                        $(".layui-collapse").empty().append(html);
                        element.init('collapse');// 重新初始化 collapse
                    })
                }
			}
            //绑定操作按钮
            $(document).on('click','.operator-btn', function(){
                var type = $(this).data('type');
                var id = $(this).data('info');
                active[type] ? active[type].call(this,id) : '';
            });
        });
	</script>
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