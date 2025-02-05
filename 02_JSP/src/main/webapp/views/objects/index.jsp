<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-04
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>JSP 내장 객체</title>
</head>
<body>
	<h2>JSP 내장 객체</h2>

	<h3>1. request</h3>
	<p>
		웹 브라우저의 요청 정보를 가지고 있는 객체이다.
	</p>

	<h4>1) 헤더와 관련된 메소드</h4>
	
	<table border="1">
		<tr>
			<td>헤더 이름</td>
			<td>헤더 값</td>
		</tr>
		<%
			Enumeration<String> headerNames = request.getHeaderNames();
			
			while(headerNames.hasMoreElements()) {
				String headerName = headerNames.nextElement();
		%>
		<tr>
			<td><%= headerName %></td>
			<td><%= request.getHeader(headerName) %></td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h4>2) URL / URI, 요청 방식과 관련된 메소드</h4>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>값</td>
		</tr>
		<tr>
			<td>프로토콜</td>
			<td><%= request.getProtocol() %></td>
		</tr>
		<tr>
			<td>요청 방식</td>
			<td><%= request.getMethod() %></td>
		</tr>
		<tr>
			<td>URL</td>
			<td><%= request.getRequestURL() %></td>
		</tr>
		<tr>
			<td>URI</td>
			<td><%= request.getRequestURI() %></td>
		</tr>
		<tr>
			<td>Query String</td>
			<td><%= request.getQueryString() %></td>
		</tr>
		<tr>
			<td>웹 애플리케이션 경로</td>
			<td><%= request.getContextPath() %></td>
		</tr>
	</table>

	<h3>2. response</h3>
	<p>
	
	</p>

	<h4>1) 응답 헤더와 관련된 메소드</h4>
	<%
		// response.setContentType("text/html;charset=utf-8");
		response.setHeader("헤더 이름", "헤더 값");
	%>

	<h4>2) 응답 상태와 관련된 메소드</h4>
	<%
		// response.setStatus(201);
		// response.sendError(500);
        // response.sendError(HttpServletResponse.SC_NOT_FOUND);
	%>

	<h4>3) 리다이렉트(Redirect)</h4>
	<p>
		지정된 URL로 클라이언트가 요청을 재전송한다.
	</p>

	<a href="redirect.jsp">View Details</a><br/>

	<h3>3. PageContext</h3>
	<p>
		JSP와 관련된 다른 내장 객체를 얻어내거나 포워드 하는데 사용하는 객체이다.
	</p>
	
	<h4>1) 포워드(Forward)</h4>
	<p>
		현재 페이지의 요청과 응답의 제어권을 다른 페이지로 넘겨준다.
	</p>
	<a href="forward.jsp">View Details</a><br/>

	<h3>4. Session</h3>
	<h4>1) 세션이란?</h4>
	<p>
		웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체이다.<br/>
	</p>
	<ol>
		<li>세션이란 서버 측의 컨테이너에서 관리되는 정보를 의미한다.</li>
		<li>세션은 클라이언트와 서버 간의 상태를 유지시켜주는 역할을 한다.</li>
		<li>세션의 정보는 클라이언트에서 접속해서 브라우저를 종료할 때까지 유지된다.</li>
	</ol>
	
	<%
		session.setAttribute("userId", "hong123");
        // 클라이언트의 요청이 없더라도 세션을 유지할 시간을 초 단위로 설정한다.
        session.setMaxInactiveInterval(3);
	%>

	세션 ID : <%= session.getId() %><br/>
	isNew : <%= session.isNew() %><br/>
	생성 시간 : <%= new Date(session.getCreationTime()) %><br/>
	최종 접속 시간 : <%= new Date(session.getLastAccessedTime()) %><br/>
	userId : <%= session.getAttribute("userId") %>

	<h4>2) Cookie란?</h4>

	<ol>
		<li>쿠키란 클라이언트 측에서 관리되는 정보를 의미한다.</li>
		<li>쿠키는 클라이언트와 서버 간의 상태를 유지시켜주는 역할을 한다.</li>
	</ol>

	<%
		// 서버에서 쿠키 생성 후 클라이언트로 전송하는 방법
		Cookie cookie = new Cookie("user-name", "GilDongHong");
		
		cookie.setMaxAge(3);
        
        response.addCookie(cookie);
        
        // 클라이언트에서 서버로 전송한 쿠키를 얻어오는 방법
		Cookie[] cookies = request.getCookies();
		
		Arrays.stream(cookies).forEach(c -> {
			System.out.println(c.getName());
			System.out.println(c.getValue());
			System.out.println();
		});
	%>
	
	<h3>5. Application</h3>
	<p>
		웹 애플리케이션의 실행 환경을 제공하는 서버의 정보와 서버 측 자원에 대한 정보를 저장하고 있는 객체이다.
	</p>

	<table border="1">
		<tr>
			<td>서버 정보</td>
			<td><%= application.getServerInfo() %></td>
		</tr>
		<tr>
			<td>웹 모듈 버전</td>
			<td><%= application.getMajorVersion() %>.<%= application.getMajorVersion() %></td>
		</tr>
		<tr>
			<td>웹 애플리케이션의 실제 파일 시스템 경로</td>
<%--			<td><%= application.getRealPath("/") %></td>--%>
			<td><%= application.getRealPath("/views/error/error404.jsp") %></td>
		</tr>
	</table>
	
</body>
</html>
