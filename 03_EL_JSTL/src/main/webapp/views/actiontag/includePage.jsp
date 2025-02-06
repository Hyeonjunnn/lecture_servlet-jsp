<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오후 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	String year = "2024";
%>
<head>
	<title>include 페이지</title>
</head>
<body>
	<h3>include 페이지</h3>
	<p>
		includePage.jsp 페이지의 year 변수의 값은 <%= year %> 입니다.
	</p>

	userName : ${param.userName}<br/>
	userName : <%= request.getParameter("userName") %><br/><br/>
</body>
</html>
