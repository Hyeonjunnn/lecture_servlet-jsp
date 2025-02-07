<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-07
  Time: 오전 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
	<title>JSTL Formatting Library</title>
</head>
<body>
	<h2>JSTL Formatting Library</h2>
	
<%--	<fmt:setLocale value="en_US"/>--%>
	<fmt:setLocale value="ja_JP"/>
	${pageContext.response.locale}
	
	<h3>1. fmt:formatNumber 액션 태그</h3>
	<p>
		숫자 데이터의 출력 형식을 지정할 때 사용하는 액션 태그이다.
	</p>

	세 자리마다 구분하여 출력 : <fmt:formatNumber value="123456789" groupingUsed="true"/><br/>
	숫자 그대로 출력 : <fmt:formatNumber value="123456789" groupingUsed="false"/><br/>
	<br/>
	
	<%--
		pattern 속성
		- 출력하는 숫자 데이터의 패턴을 지정한다.
		- #, 0을 패턴 기호로 사용한다.
		- 패턴 기호가 부족하나 부분에 대해서는 #은 표시하지 않지만 0은 0으로 표시한다.
		- 패턴 기호를 초과하는 부분은 반올림된다.
	--%>
	<fmt:formatNumber value="1.2346" pattern="#.###"/><br/>
	<fmt:formatNumber value="1.2346" pattern="0.000"/><br/>
	<fmt:formatNumber value="1.23" pattern="#.###"/><br/>
	<fmt:formatNumber value="1.23" pattern="0.000"/><br/>
	<br/>

	숫자 : <fmt:formatNumber value="50000"/><br/>
	숫지 : <fmt:formatNumber type="number" value="50000"/><br/>
	통화 : <fmt:formatNumber type="currency" value="50000"/><br/>
	통화 : <fmt:formatNumber type="currency" currencySymbol="$" value="50000"/><br/>
	백분율 : <fmt:formatNumber type="percent" value="0.7"/><br/>

	<h3>2. fmt:formatDate 태그</h3>
	<p>
		날짜와 시간의 데이터 형식을 지정할 때 사용하는 액션 태그이다.
	</p>

	<c:set var="now" value="<%= new Date() %>"/>

	<ul>
		<li>${now}</li>
		<li><fmt:formatDate value="${now}"/></li>
		<li><fmt:formatDate type="date" value="${now}"/></li>
		<li><fmt:formatDate type="time" value="${now}" /></li>
		<li><fmt:formatDate type="both" value="${now}" /></li>
		<li><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}" /></li>
		<li><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now}" /></li>
		<li><fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${now}" /></li>
		<li><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" /></li>
		<li><fmt:formatDate type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)" value="${now}" /></li>
	</ul>
</body>
</html>
