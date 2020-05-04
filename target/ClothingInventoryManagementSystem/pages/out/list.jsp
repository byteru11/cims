<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/4/25
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
    <meta charset="UTF-8">
    <title>订单列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

    <body>
        <div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">订单管理</a>
        <a><cite>订单列表</cite></a>
      </span>
            <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="weadmin-body">
            <div class="layui-row">
                <form class="layui-form layui-col-md12 we-search" action="findAllByName.do" method="post">
                    出库单搜索：
                    <div class="layui-inline">
                        <input type="text" name="time1" placeholder="选择日期" class="layui-input" id="start"/>
                    </div>

                    <div class="layui-inline">
                        <input type="text" name="time2" placeholder="选择日期" class="layui-input" id="end" />
                    </div>
                    <div class="layui-inline">
                        <input type="text" name="name" placeholder="所出仓库" class="layui-input" />
                    </div>

                    <div class="layui-inline">
                        <input type="text" name="id" placeholder="单据编号" class="layui-input" />
                    </div>

                    <button class="layui-btn" lay-submit="" lay-filter="sreach">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </form>
            </div>
            <div class="weadmin-block">
                <button class="layui-btn layui-btn-disabled"
<%--                        onclick="WeAdminShow('添加单据','${pageContext.request.contextPath}/pages/out/add.jsp',800,550)--%>
                        ">
                    <i class="layui-icon layui-icon-add-circle-fine"></i>添加
                </button>
                <span class="fr" style="line-height:40px">共有数据：${outs==null?pageInfo.total:outs.size()} 条</span>
            </div>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>单据编号</th>
                        <th>所出仓库</th>
                        <th>出库日期</th>
                        <th>经办人</th>
                        <th>去处</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${outs==null?pageInfo.list:outs}" var="out">
                        <tr data-id="1">
                            <td>${out.id}</td>
                            <td>${out.name}</td>
                            <td>${out.date}</td>
                            <td>${out.username}</td>
                            <td>${out.out}</td>
                            <td class="td-manage">
                                <a title="详情" class="layui-btn layui-btn-radius layui-btn-normal layui-btn-sm layui-inline"
                                   onclick="WeAdminShow('详情','${pageContext.request.contextPath}/out/findProduct.do?id=${out.id}',620,520)">详情</a>

                                <a class="layui-inline" title="编辑" onclick="WeAdminEdit('编辑','${pageContext.request.contextPath}/pages/out/edit.jsp?a=${out.name}&b=${out.date}&c=${out.username}&d=${out.out}&e=${out.text}&f=${out.id}&g=${out.no}&h=${out.number}', 1, 600, 550)" href="javascript:;">
                                    <i class="layui-icon layui-icon-edit"></i>
                                </a>
                                <a  class="layui-inline" title="删除" href="deleteOut.do?id=${out.id}">
                                    <i class="layui-icon layui-icon-delete"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="page">
                <div>
                    <a class="prev" href="${pageContext.request.contextPath}/out/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&lt;&lt;</a>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                        <a class="num" href="${pageContext.request.contextPath}/out/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                    </c:forEach>
                    <a class="next" href="${pageContext.request.contextPath}/out/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&gt;&gt;</a>
                </div>
            </div>

        </div>
        <script>
            layui.extend({
                admin: '${pageContext.request.contextPath}/static/js/admin'
            });
            layui.use(['laydate','jquery','admin'], function() {
                var laydate = layui.laydate,
                    $ = layui.jquery,
                    admin = layui.admin;
                //执行一个laydate实例
                laydate.render({
                    elem: '#start' //指定元素
                });
                //执行一个laydate实例
                laydate.render({
                    elem: '#end' //指定元素
                });

                /*用户-删除*/
                window.member_del = function (obj, id) {
                    layer.confirm('确认要删除吗？', function (index) {
                        //发异步删除数据
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {
                            icon: 1,
                            time: 1000
                        });
                    });

                }
                function delAll(argument) {
                    var data = tableCheck.getData();
                    layer.confirm('确认要删除吗？' + data, function(index) {
                        layer.msg('删除成功', {
                            icon: 1
                        });
                        $(".layui-form-checked").not('.header').parents('tr').remove();
                    });
                }
            });
        </script>
    </body>

</html>
