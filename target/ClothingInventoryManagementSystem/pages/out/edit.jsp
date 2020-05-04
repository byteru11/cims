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
                <form class="layui-form" action="../../out/updateOut.do" method="post">

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            所出仓库
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${param.a}"  placeholder="仓库名" name="name" autocomplete="off" class="layui-input">
                        </div>

                        <div class="layui-input-inline">
                            <input type="hidden" id="L_username" value="${param.f}" readonly="readonly"  placeholder="单据编号" name="id" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            出库日期
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${param.b}" placeholder="入库日期" readonly="readonly" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            经办人
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username" value="${param.c}" placeholder="经办人" name="username" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            去处
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${param.d}" placeholder="去处" name="out" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            货物序号
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${param.g}" placeholder="货物序号" name="no" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            数量
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_username1" value="${param.h}" placeholder="数量" name="number" lay-verify="required|nikename" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label layui-inline">备注</label>
                        <div class="layui-input-block">
                            <textarea name="text" class="layui-textarea" placeholder="留下点什么嘛！" lay-verify="required|nikename" >${param.e}</textarea>
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
                            if(value.length < 1) {
                                return '至少得1个字符啊';
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
