<%--~
  ~ @Copyright:2020  
  ~ @Author:Zero
  ~ @LastModified:2020-05-02 19:52:51
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/5/2
  Time: 19:52
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
        <link rel="stylesheet" href="../../static/css/font.css">
        <link rel="stylesheet" href="../../static/css/weadmin.css">
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <div class="weadmin-body">
            <div class="weadmin-body">
                <form class="layui-form" action="../../product/updateProduct.do" method="post">

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="we-red">*</span>色号
                        </label>
                        <div class="layui-input-inline">
                            <select name="color">
                                <option value="${param.c}">${param.c}</option>
                                <option value="大红色">大红色</option>
                                <option value="黑色">黑色</option>
                                <option value="绿色">绿色</option>
                                <option value="白色">白色</option>
                                <option value="红色">红色</option>
                                <option value="黄色">黄色</option>
                                <option value="青色">青色</option>
                            </select>
                        </div>
                        <div class="layui-form-item layui-inline">
                            <div class="layui-input-inline">
                                <input type="hidden" id="L_username" value="${param.a}" placeholder="序号" name="id" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="we-red">*</span>尺码
                        </label>
                        <div class="layui-input-inline">
                            <select name="size">
                                <option value="${param.d}">${param.d}</option>
                                <option value="155">155</option>
                                <option value="160">160</option>
                                <option value="165">165</option>
                                <option value="170">170</option>
                                <option value="175">175</option>
                                <option value="180">180</option>
                                <option value="185">185</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="we-red">*</span>品名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${param.e}" name="product_name" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="we-red">*</span>出厂价
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_pass" value="${param.f}" name="ex_price" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="we-red">*</span>零售价
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_repass" value="${param.g}" name="price" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                        </label>
                        <button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
                    </div>
                </form>
            </div>
            <script src="../../lib/layui/layui.js" charset="utf-8"></script>
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
                            if(value.length < 2) {
                                return '至少得2个字符';
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
