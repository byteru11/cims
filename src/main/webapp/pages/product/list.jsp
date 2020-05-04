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
                    货号查询：
                    <div class="layui-inline">
                        <input type="text" name="product_id" placeholder="货号" class="layui-input" />
                    </div>
                    <div class="layui-inline">
                        <input type="text" name="product_name" placeholder="品名" class="layui-input" />
                    </div>
                    <div class="layui-input-inline">
                        <select name="color">
                            <option value="">色号</option>
                            <option value="大红色">大红色</option>
                            <option value="黑色">黑色</option>
                            <option value="绿色">绿色</option>
                            <option value="白色">白色</option>
                            <option value="红色">红色</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="size">
                            <option value="">尺码</option>
                            <option value="160">160</option>
                            <option value="165">165</option>
                            <option value="170">170</option>
                            <option value="175">175</option>
                            <option value="180">180</option>
                        </select>
                    </div>
                    <button class="layui-btn" lay-submit="" lay-filter="sreach">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </form>
            </div>
            <div class="weadmin-block">
                <button class="layui-btn" onclick="WeAdminShow('添加用户','${pageContext.request.contextPath}/pages/product/add.html',580,510)">
                    <i class="layui-icon layui-icon-add-circle-fine"></i>添加
                </button>
                <span class="fr" style="line-height:40px">共有数据：${products==null?pageInfo.total:products.size()} 条</span>
            </div>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>货号</th>
                        <th>色号</th>
                        <th>尺码</th>
                        <th>品名</th>
                        <th>出厂价</th>
                        <th>零售价</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${products==null?pageInfo.list:products}" var="product">
                        <tr data-id="1">
                            <td>${product.id}</td>
                            <td>${product.product_id}</td>
                            <td>${product.color}</td>
                            <td>${product.size}</td>
                            <td>${product.product_name}</td>
                            <td>${product.ex_price}</td>
                            <td>${product.price}</td>
                            <td class="td-manage">
                                <a title="编辑" onclick="WeAdminEdit('编辑','${pageContext.request.contextPath}/pages/product/edit.jsp?a=${product.id}&b=${product.product_id}&c=${product.color}&d=${product.size}&e=${product.product_name}&f=${product.ex_price}&g=${product.price}', 1, 550, 490)" href="javascript:;">
                                    <i class="layui-icon layui-icon-edit"></i>
                                </a>
                                <a title="删除" href="deleteProduct.do?id=${product.id}">
                                    <i class="layui-icon layui-icon-delete"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="page">
                <div>
                    <a class="prev" href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&lt;&lt;</a>
                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                        <a class="num" href="${pageContext.request.contextPath}/product/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                    </c:forEach>
                    <a class="next" href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&gt;&gt;</a>
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
