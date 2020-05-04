<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-05-04 15:43:27
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/5/4
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

    <head>
        <meta charset="UTF-8">
        <title>添加会员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
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
            <form class="layui-form" action="../../out/addOut.do" method="post">
                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label layui-inline">
                        仓库
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" value="广州仓库" placeholder="仓库名" name="name" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label layui-inline">
                        经办人
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" value="${sessionScope.uid}" readonly="readonly" name="username" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label layui-inline">
                        去处
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" value="第一分公司" placeholder="去处" name="out" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label layui-inline">
                        货物序号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" value="1" placeholder="货物序号" name="no" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_username" class="layui-form-label layui-inline">
                        数量
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_username" value="200" placeholder="数量" name="number" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label layui-inline">备注</label>
                    <div class="layui-input-block">
                        <textarea name="desc" class="layui-textarea" placeholder="留下点什么嘛"></textarea>
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

        <script>
            layui.extend({
                admin: '{/}../../static/js/admin'
            });
            layui.use(['form', 'jquery','util','admin', 'layer'], function() {
                var form = layui.form,
                    $ = layui.jquery,
                    util = layui.util,
                    admin = layui.admin,
                    layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if(value.length < 1) {
                            return "至少得一个字符啊";
                        }
                    },
                    pass: [/(.+){3,12}$/, '密码必须3到12位'],
                    repass: function(value) {
                        if($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });
                //失去焦点时判断值为空不验证，一旦填写必须验证
                $('input[name="email"]').blur(function(){
                    //这里是失去焦点时的事件
                    if($('input[name="email"]').val()){
                        $('input[name="email"]').attr('lay-verify','email');
                    }else{
                        $('input[name="email"]').removeAttr('lay-verify');
                    }
                });

                //监听提交
                form.on('submit(add)', function() {
                    layer.alert("增加成功",{
                        icon: 6
                    }, function() {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                });
                return false;
            });
        </script>
    </body>
</html>
