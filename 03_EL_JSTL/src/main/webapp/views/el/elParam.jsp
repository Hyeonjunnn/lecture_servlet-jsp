<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html>
<head>
	<title>주문 내역</title>
</head>
<body>
	<h2>주문 내역</h2>
	상품명 : ${param.pName}<br/>
	수량 : ${param.pCount}<br/>
	옵션 1 : ${paramValues.pOption[0]}<br/>
	옵션 2 : ${paramValues.pOption[1]}<br/>
</body>
</html>
