<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>jsp:forward 액션 태그</title>
</head>
<body>
	<h2>jsp:forward 액션 태그</h2>
	<p>
		jsp:forward 액션 태그는 다른 페이지로 요청을 전달할 때 사용하는 액션 태그이다.
	</p>
	
	<%
		request.setAttribute("userName", "홍길동");
        request.setAttribute("userAge", 24);
	%>

	<jsp:forward page="forwardPage.jsp">
		<jsp:param name="address" value="서울특별시"/>
	</jsp:forward>
</body>
</html>
