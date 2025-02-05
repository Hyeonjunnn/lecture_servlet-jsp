<%@ page import="java.util.Arrays" %>
<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-04
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
	// 폼  파라미터 값 읽어오기
	String userName = request.getParameter("userName");
    String userAge = request.getParameter("userName");
    String gender = request.getParameter("gender");
    String[] foods = request.getParameterValues("food");
	
	// System.out.println(userName);
	// System.out.println(userAge);
	// System.out.println(gender);
	// System.out.println(Arrays.toString(foods));
%>
<html>
<head>
	<title>개인 정보 출력</title>
</head>
<body>
	<h2>개인 정보 출력</h2>

	<%= userName %>님은 <%= userAge %>세, 성별은 <%= gender %> 입니다.<br/>
	좋아하는 음식은
	<%
		for (String food : foods) {
	%>
	<span style="color: aqua;">
	<%= food + " "%>
	</span>
	<%
		}
	%>
	입니다.
</body>
</html>
