<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-04-30 00:04:11
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/4/30
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>管理员登录-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="./static/css/font.css">
        <link rel="stylesheet" href="./static/css/weadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
    </head>
    <body class="login-bg">

        <div class="login">
            <div class="message">WeAdmin 1.0-管理登录</div>
            <div id="darkbannerwrap"></div>

            <form method="post" class="layui-form" action="./user/findPassword.do">
                <input name="uid" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
                <hr class="hr15">
                <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
                <hr class="hr15">
                <input class="loginin" value="登录" style="width:100%;" type="submit">
                <hr class="hr20" >
            </form>
        </div>

        <script type="text/javascript">
            layui.extend({
                admin: '{/}./static/js/admin'
            });
            layui.use(['form','admin'], function(){
                var form = layui.form
                    ,admin = layui.admin,
                    $ = layui.jquery;
            });
        </script>
        <!-- 底部结束 -->
</html>
