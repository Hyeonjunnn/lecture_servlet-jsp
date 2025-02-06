<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오후 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>jsp:include 액션 태그</title>
</head>
<body>
	<h2>jsp:include 액션 태그</h2>
	<p>
		jsp:include 액션 태그는 다른 페이지를 포함시킬 때 사용하는 액션 태그이다.
	</p>

	<h3>1. include 지시어 (정적 include 방식)</h3>
	<p>
		다른 페이지를 포함하는 JSP 파일이 컴파일되기 전에 페이지가 삽입된다.
	</p>
<%--	<%@ include file = "includePage.jsp" %>--%>
	
	<%--
	include.jsp 페이지의 year 변수와 값은 <%= year %>입니다.
	--%>
	
	<%--
	<%
		String year = "2025";
	%>
	--%>
	
	<h3>2. jsp:include 액션 태그</h3>
	<p>
		다른 페이지를 포함하는 JSP 파일이 화면에 출력되는 시점(런타임)에 삽입된다.
	</p>
	
	<%-- jsp:param 액션 태그를 이용해서 포함되는 페이지로 값을 전달할 수 있다. --%>
	<jsp:include page="includePage.jsp" >
		<jsp:param name="userName" value="홍길동"/>
	</jsp:include>

	<%
		// 중복되는 변수명으로 선언해도 에러가 발생하지 않는다.
		String year = "2025";
	%>

	include.jsp 페이지의 year 변수값은 <%= year %> 입니다.

</body>
</html>
