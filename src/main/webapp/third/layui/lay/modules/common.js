/** common.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
layui.define(['layer','form'], function(exports) {
	"use strict";
	var $ = layui.jquery,
		layer = layui.layer, form = layui.form;

	var common = {
		/**
		 * 抛出一个异常错误信息
		 * @param {String} msg
		 */
		throwError: function(msg) {
			throw new Error(msg);
			return;
		},
		/**
		 * 弹出一个错误提示
		 * @param {String} msg
		 */
		msgError: function(msg) {
			layer.msg(msg, {
				icon: 5
			});
			return;
		},
		/**
		 *   将post的数据转换成key-val的格式，支持基本数据类型的数组参数转换为多个key-val，不支持对象转换需自己转换后调用请求
		 * */
        arrayTokeyval: function (data) { // 将post的数据转换成key-val的格式，支持基本数据类型的数组参数转换为多个key-val，不支持对象转换需自己转换后调用请求
            let ret = ''
            for (let it in data) {
                if (data[it] instanceof Array) {
                    for (let arr of data[it]) {
                        ret += encodeURIComponent(it) + '=' + encodeURIComponent(arr) + '&'
                    }
                } else {
                    ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
                }
            }
            return ret
        },
        layerShowIframe: function (url,title,isFull) {//弹出新窗口
            var index = layer.open({
                type: 2,
                title: title,
                shadeClose: true,
                shade:0.5,
                maxmin: true, //开启最大化最小化按钮
                offset: ['0px'],
                area: ['1000px', '600px'],
                content: url
            });
            if (isFull){
                layer.full(index)
            }
            return index;
        },
        addForm: function (options) {//弹出窗口 类型为1
            var success = options.success
            var index = layer.open($.extend({
                type: 1,
                title: "",
                shadeClose: true,
                shade:0.5,
                maxmin: true, //开启最大化最小化按钮
                area: ['1000px', '600px'],
                content: "",
                btn: ['保存', '取消'],
                success: function(layero, index){
                    typeof success === 'function' && success.apply(this, arguments);
                },
                btn2: function (index, layero) {
                    var formEm = $(layero).find('form');
                    formEm[0].reset();
                },
                cancel: function (index, layero) {
                    var formEm = $(layero).find('form');
                    formEm[0].reset();
                }
            }, options));
            let  isFull = options.isFull;
            if (isFull) {
                layer.full(index);
            }
        },
        editForm: function (options) {//弹出窗口 类型为1
            var success = options.success
            var index = layer.open($.extend({
                type: 2,
                title: "",
                shadeClose: true,
                shade:0.5,
                maxmin: true, //开启最大化最小化按钮
                area: ['1000px', '600px'],
                content: "",
                btn: ['保存', '取消'],
                success: function(layero, index){
                    typeof success === 'function' && success.apply(this, arguments);
                },
                btn2: function (index, layero) {
                    var formEm = $(layero).find('iframe').contents().find('form');
                    formEm[0].reset();
                },
                cancel: function (index, layero) {
                    var formEm = $(layero).find('iframe').contents().find('form');
                    formEm[0].reset();
                }
            }, options));
            let  isFull = options.isFull;
            if (isFull) {
                layer.full(index);
            }
        },
        formatForm: function (form) {
            var a = form.serializeArray();
            var o = {};
            $.each(a, function() {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        },
        infoForm: function (options) {//弹出窗口 类型为1
            var index = layer.open($.extend({
                type: 2,
                title: "",
                shadeClose: true,
                shade:0.5,
                maxmin: true, //开启最大化最小化按钮
                content: "",
            }, options));
            let  isFull = options.isFull;
            if (isFull) {
                layer.full(index);
            }
        },
        post: function (url,data,callback) {
            if ( $.isFunction( data ) ) {
                callback = data;
                data = undefined;
            }
            $.ajax({
                type: "POST",
                url: url,
                data: common.arrayTokeyval(data),
                success: callback
            });
        },
        stampToDate: function (stamp) {
            if (stamp == undefined || stamp == "") {
                return "";
            }
            var newDate = new Date();
            var stampArr = stamp.split(",");
            var dateArr = new Array();
            for (var i = 0; i < stampArr.length; i++) {
                var newDate = new Date();
                newDate.setTime(stampArr[i]);
                dateArr.push(newDate.Format("yyyy-MM-dd"));
            }
            return dateArr.join(" , ");
        },
        showImage: function (url,showMaxWidth) {
            if (url !== null) {
                layui.img(url,function (img) {
                    let width = img.naturalWidth;
                    if (width > showMaxWidth) {
                        width = showMaxWidth;
                    }
                    layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0,
                        area: width,
                        skin: 'layui-layer-nobg', //没有背景色
                        shadeClose: true,
                        content: '<img src="'+url+'" width="'+width+'px" />'
                    });
                },function (e) {
                    layer.msg("图片加载失败！",{icon: 5});
                })
            }
        }
	};
	exports('common', common);
});
