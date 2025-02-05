<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-05
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>영역 개체</title>
</head>
<body>
	<h2>Session 영역과 Application 영역의 비교</h2>

	Session 영역에 저장된 데이터 : <%= session.getAttribute("address") %><br/>
	Application 영역에 저장된 데이터 : <%= application.getAttribute("name") %><br/>
</body>
</html>
