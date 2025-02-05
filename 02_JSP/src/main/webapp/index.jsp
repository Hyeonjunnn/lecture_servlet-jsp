<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP(Java Server Page)</title>
</head>
<body>
    <h2>JSP(Java Server Page)</h2>

    <h3>1. JSP</h3>
    <p>
        JSP는 HTML 코드 안에서 스크립트 형태로 자바 언어를 사용하여 동적인 페이지를 생성한다.
    </p>

    <h3>2. JSP 요소(Elements)</h3>
    <p>
        JSP 페이지에서 자바 코드를 직접 기술할 수 있게 해주는 요소이다.
    </p>
    <ol>
        <li>주석 태그</li>
        <li>지시자 태그</li>
        <li>선언문 태그</li>
        <li>스크립트릿 태그</li>
        <li>표현식 태그</li>
    </ol>

	<%--<a href="views/elements/index.jsp">View Details</a><br/> --%>
	<a href="<%= request.getContextPath() %>/views/elements">View Details</a><br/>
	<%--<a href="views/directive/index.jsp">View Details</a><br/> --%>
	<a href="<%= request.getContextPath() %>/views/directive">View Details</a><br/>

	<h3>3. JSP 내장 객체</h3>
	<p>
		JSP가 서블릿으로 변환될 때 자바 파일에 자동으로 추가되는 객체들을 내장 객체라고 한다.<br/>
		즉, JSP 페이지 내부에서 개발자가 선언하지 않아도 바로 사용이 가능한 객체이다.
	</p>
    
    세션 테스트<br/>
    userId : <%= session.getAttribute("userId") %><br/>
	
	<a href="<%= request.getContextPath() %>/views/objects">View Details</a>
    
    <h3>4. 영역 객체</h3>
    <p>
	    JSP에서 제공하는 내장 객체들 중에 pageContext, request, session, application
	    객체는 해당 객체에 정의된 유효한 범위를 갖는다.<br/>
	    해당 객체들은 유효한 범위 안에서 필요한 데이터를 서로 공유할 수 있는데 이 공유되는 데이터를
	    속성(Attribute)이라고 한다.
    </p>
    <ol>
	    <li>Page 영역</li>
	    <li>Request 영역</li>
	    <li>Session 영역</li>
	    <li>Application 영역</li>
    </ol>
    
    <a href="<%=request.getContextPath() %>/views/scope">View Details</a>
</body>
</html>