<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-05-02 20:08:18
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/5/2
  Time: 20:08
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
                <form class="layui-form" action="../../user/updateUser.do" method="post">
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="we-red">*</span>登录名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${param.b}" name="uid" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                            <input type="hidden" id="L_username" value="${param.a}"  name="id" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            请设置至少2个字符，将会成为您唯一的登录名
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="we-red">*</span>姓名
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${param.c}" name="username" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="we-red">*</span>密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_pass" name="password" lay-verify="required|pass" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            3到16个字符
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="we-red">*</span>确认密码
                        </label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_repass" name="repass" lay-verify="required|repass" autocomplete="off" class="layui-input">
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
