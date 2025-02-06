<%@ page import="com.beyond.eljstl.Student" %><%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-05
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
	// Request 영역에 저장된 속성을 가져온다.
	// Integer classRoom = (Integer) request.getAttribute("classRoom");
	// Student student = (Student) request.getAttribute("student");
 
	// Session 영역에 저장된 속성을 가져온다.
	// int classRoom = (Integer) session.getAttribute("classRoom"); // Auto Unboxing
	// Student student = (Student) session.getAttribute("student");
%>
<html>
<head>
	<title>EL(Expression Language)</title>
</head>
<body>
	<h2>EL(Expression Language)</h2>

	<h3>1. 기존 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>
	<%--
	강의장 : 강의실 <%= classRoom %><br/>
	수강생 : <%= student.getName() %> <%= student.getAge() %>
	--%>
	
	<h3>2. EL 방식으로 request, session 객체에 담겨있는 데이터를 출력</h3>

	<%--
		1. EL은 영역 객체에 저장된 속성명을 검색해서 존재하는 경우 값을 가져온다.
			- Page 영역 -> Request 영역 -> Session 영역 -> Application 영역 순으로 해당 속성을 찾아서 값을 가져온다.
			
	--%>
	강의장 : 강의실 ${classRoom}<br/>
	수강생 : ${student.name} ${student.age}

	<br/><br/>
	
	강의장 : 강의실 ${sessionScope.classRoom}<br/>
	수강생 : ${sessionScope.student.name} ${sessionScope.student.age}

	<h3>3. EL 사용 시 영역 객체에 저장된 속성명이 같은 경우</h3>
	<%
		pageContext.setAttribute("scope", "Page 영역");
	%>
	scope: ${scope}<br/>
	pageScope: ${pageScope.scope}<br/>
	requestScope: ${requestScope.scope}<br/>
	sessionScope: ${sessionScope.scope}<br/>
	applicationScope: ${applicationScope.scope}<br/>
	
	<h3>4. ContextPath 가져오기</h3>

	<h4>1) 표현식 태그를 사용하는 방법</h4>
	ContextPath : <%= request.getContextPath() %>

	<h4>2) EL을 사용하는 방법</h4>
	ContextPath : ${pageContext.request.contextPath}

	<h3>5. 헤더에 접근하기</h3>
	<h4>1) 표현식 태그를 사용하는 방법</h4>
	Host : <%= request.getHeader("Host") %><br/>
	User-Agent : <%= request.getHeader("User-Agent") %>
	
	<h4>2) EL을 사용하는 방법</h4>
	<%--
	Host : ${header.host}<br/>
	User-Agent : ${header.userAgent}
	--%>
	Host : ${header['Host']}<br/>
	User-Agent : ${header['User-Agent']}<br/>

	<h3>6. 쿠키에 접근하기</h3>
	<h4>1) 표현식 태그를 사용하는 방법</h4>
	JSESSIONID : <%= request.getCookies()[0].getValue() %><br/>

	<h4>2) EL을 사용하는 방법</h4>
	<%--
	JSESSIONID : ${cookie.JSESSIONID.value}<br/>
	--%>
	JSESSIONID : ${cookie['JSESSIONID'].value}<br/>

	<h3>7. 파라미터 접근하기</h3>
	<form action="${pageContext.request.contextPath}/views/el/elParam.jsp" method="get">
		<fieldset>
			<legend>제품 입력</legend>
			<input type="text" name="pName" placeholder="제품명을 입력하세요."/>
			<br/>
			<input type="number" name="pCount" placeholder="수량을 입력하세요."/>
			<br/>
			<input type="text" name="pOption" placeholder="옵션을 입력하세요."/>
			<br/>
			<input type="text" name="pOption" placeholder="옵션을 입력하세요."/>
			<br/>
		</fieldset>
		
		<input type="submit" value="전송"/>
		<input type="reset" value="초기화"/>
	</form>
</body>
</html>
