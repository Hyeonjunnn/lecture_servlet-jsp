<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-04
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java"
isErrorPage="true" %>
--%>

<html>
<head>
	<title>에러 페이지</title>
</head>
<body>
	<h2>에러가 발생하였습니다. 관리자에게 문의해 주세요.</h2>

<%--	<button onclick="history.back()">이전 페이지로</button>--%>
	<button onclick="history.go(-1);">이전 페이지로</button>

<%--<%= exception %>--%>
<%--<%= exception.getMessage() %>--%>
<%--<%= exception.getClass().getName() %>--%>
</body>
</html>
