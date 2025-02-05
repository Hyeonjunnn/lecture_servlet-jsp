<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-04
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP 스크립트 요소</title>
</head>
<body>
    <h2>JSP 스크립트 요소</h2>
	<!-- HTML 주석 태그 -->
	<%-- JSP 주석 태그 --%>
	<%--
		두 주석의 차이점
		페이지의 소스 보기 혹은 개발자 도구에서 HTML 주석은 확인 가능하고 JSP 주석은 확인이 불가능하다.
	 --%>

	<%-- 선언문 태그 --%>
	<%!
		// 필드 선언
		private String name = "홍길동";
        
        // 메소드 선언
		public String getName(){
            return this.name;
		}
	%>

	<%-- 스크립트릿 태그 --%>
	<%
		// 자바 코드
		int sum = 0;
		
		for (int i = 1; i < 6; i++) {
			sum += i;
   
	%>
    <h3>안녕하세요.</h3>
	<%
		}
		System.out.println(sum);
	%>

	<%-- 표현식 태그 --%>
	저의 이름은 <% out.print(name); %>입니다.<br/>
	저의 이름은 <%= name %>입니다.<br/>

	1부터 5까지의 합은 <span style="color: red; font-size: 2rem;"><%= sum %></span>
</body>
</html>
