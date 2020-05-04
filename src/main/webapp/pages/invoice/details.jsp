<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-05-03 20:30:55
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/5/3
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>会员资料编辑-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <div class="weadmin-body">
            <div class="weadmin-body">
                <form class="layui-form" method="post">

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label layui-inline">
                            货号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${invoice.product.product_id}"  readonly="readonly" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label layui-inline">
                            品名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${invoice.product.product_name}" readonly="readonly" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label layui-inline">
                            色号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${invoice.product.color}" readonly="readonly" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label layui-inline">
                            尺码
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" value="${invoice.product.size}" readonly="readonly" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label layui-inline">
                            数量
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" value="${invoice.number}" readonly="readonly" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label layui-inline">备注</label>
                        <div class="layui-input-block">
                            <textarea name="desc"  readonly="readonly" class="layui-textarea">${invoice.text}</textarea>
                        </div>
                    </div>
                </form>
            </div>

            <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
            <script type="text/javascript">
                layui.extend({
                    admin: '{/}../../static/js/admin'
                });
                layui.use(['form', 'jquery', 'admin','layer'], function() {
                    var form = layui.form,
                        $ = layui.jquery,
                        admin = layui.admin,
                        layer = layui.layer;

                    //自定义验证规则
                    form.verify({
                        nikename: function(value) {
                            if(value.length < 3) {
                                return '昵称至少得3个字符啊';
                            }
                        }
                    });
                    //监听提交
                    form.on('submit(add)', function() {
                        layer.alert("修改成功");
                    });
                });
            </script>
    </body>
</html>
