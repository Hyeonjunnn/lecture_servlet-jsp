<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-04
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	LocalDateTime now = LocalDateTime.now();
	String today = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 hh시 mm분 ss초"));
	
	// 에러 페이지 확인을 위한 에러 코드
	// int result = 10 / 0;
%>

<header>
	<h2>지시자 태그</h2>
	<p>
		오늘은 <span style="color: orange;"> <%= today %></span>입니다.
	</p>
</header>

