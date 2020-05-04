<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-04-27 23:49:23
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/4/27
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>后台管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="./static/css/font.css">
        <link rel="stylesheet" href="./static/css/weadmin.css">
        <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
        <c:if test="${sessionScope.uid == null}">
            <c:redirect url="login.jsp" />
        </c:if>
    </head>

    <body>
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">WeAdmin v1.0</a>
            </div>
            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                </li>
            </ul>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">登录名：${sessionScope.uid}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a class="loginout" href="./login.jsp">退出</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="https://www.Google.com/" target="_blank">前台首页</a>
                </li>
            </ul>

        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav"></div>
        </div>
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip" lay-allowclose="true">
                <ul class="layui-tab-title" id="tabName">
                    <li>我的桌面</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='./pages/404.html' frameborder="0" scrolling="yes" class="weIframe"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <!-- 底部开始 -->

        <!-- 底部结束 -->
        <script type="text/javascript">
            layui.config({
                base: './static/js/'
                ,version: '101100'
            }).extend({ //设定模块别名
                admin: 'admin'
                ,menu: 'menu'
            });
            layui.use(['jquery', 'admin', 'menu'], function(){
                var $ = layui.jquery,
                    admin = layui.admin,
                    menu = layui.menu;
                $(function(){
                    menu.getMenu('./json/menu.json');
                    var login = JSON.parse(localStorage.getItem("login"));
                    if(login){
                        if(login===0){
                            window.location.href='./login.jsp';
                            return false;
                        }else{
                            return false;
                        }
                    }else{
                        window.location.href='./login.jsp';
                        return false;
                    }
                });
            });
        </script>
    </body>
    <!--Tab菜单右键弹出菜单-->
    <ul class="rightMenu" id="rightMenu">
        <li data-type="fresh">刷新</li>
        <li data-type="current">关闭当前</li>
        <li data-type="other">关闭其它</li>
        <li data-type="all">关闭所有</li>
    </ul>

</html>
