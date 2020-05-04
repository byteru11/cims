<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--~
  ~ @Copyright:2020
  ~ @Author:Zero
  ~ @LastModified:2020-04-27 23:42:31
  --%>

<%--
  Created by IntelliJ IDEA.
  User: yoona
  Date: 2020/4/27
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>test</title>
    </head>
    <body>
        <c:forEach items="${products}" var="user">
            <c:out value="${user.toString()}" />
        </c:forEach>
    </body>
</html>
