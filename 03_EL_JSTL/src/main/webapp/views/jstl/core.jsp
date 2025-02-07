<%@ page import="com.beyond.eljstl.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>JSTL Core Library</title>
</head>
<body>
	<h2>JSTL Core Library</h2>

	<h3>1. 변수</h3>
	<h4>1) 변수 선언(c:set)</h4>
	<p>
		변수를 선언하고 초기값을 대입하는 액션 태그이다.
	</p>
	<%--
	<%
		pageContext.setAttribute("num1", "10");
	%>
	--%>
	<c:set var="num1" value="30"/>
<%--	<c:set var="num1" value="10"/>--%>
	<c:set var="num2" value="20" scope="request"/>
	<c:set var="result" value="${num1 + num2}" scope="session"/>
	<c:set var="colors" scope="application">
		red, blue, yellow, pink, green
	</c:set>
	
	num1의 값 : ${num1} 또는 ${pageScope.num1}<br/>
	num2의 값 : ${num2} 또는 ${requestScope.num2} 또는 <%= request.getAttribute("num2") %><br/>
	result의 값 : ${result} 또는 ${sessionScope.result}<br/>
	colors의 값 : ${colors} 또는 ${applicationScope.colors}<br/>

	<h4>2) 변수 삭제(c:remove)</h4>
	<p>
		c:set 액션 태그로 선언한 변수를 삭제할 때 사용하는 액션 태그이다.
	</p>
	
	<c:set var="result" value="99999"/>
	<c:set var="result" value="10000" scope="request"/>

	삭제 전 : ${result}<br/>
	<c:remove var="result" scope="page"/>

	삭제 후 : ${result}<br/>
	<c:remove var="result"/>
	
	삭제 후 : ${result}<br/>
	
	<h3>2. 출력(c:out)</h3>
	<p>
		클라이언트로 데이터를 출력할 때 사용하는 액션 태그이다.
	</p>

<%--	태그를 문자열로 출력 : <c:out value="<b>데이터 출력하기</b>"/><br/>--%>
	태그를 문자열로 출력 : <c:out value="<b>데이터 출력하기</b>" escapeXml="true"/><br/>
	태그로 해석되어 출력 : <c:out value="<b>데이터 출력하기</b>" escapeXml="false"/><br/>
	기본값 출력 : <c:out value="${result}" default="0"/>

	<h3>3. 조건 처리 태그</h3>
	
	<h4>1) c:if 액션 태그</h4>
	<p>
		자바의 if 구문과 같은 역할 을 하는 액션 태그이다.
	</p>

	<c:if test="${num1 > num2}">
		<b>num1이 num2보다 크다.</b>
	</c:if>
	
	<c:if test="${num1 < num2}">
		<b>num1이 num2보다 작다.</b>
	</c:if>

	<h4>2) c:choose 액션 태그</h4>
	<p>
		자바의 switch 구문과 같은 역할을 하는 액션 태그이다.
	</p>

	<c:choose>
		<c:when test="${num1 > num2}">
			<b>num1이 num2보다 크다.</b>
		</c:when>
		<c:when test="${num1 < num2}">
			<b>num1이 num2보다 작다.</b>
		</c:when>
		<c:otherwise>
			<b>num1과 num2는 같다.</b>
		</c:otherwise>
	</c:choose>

	<h3>4. 반복 처리 태그</h3>
	
	<h4>1) c:forEach 액션 태그</h4>
	<p>
		자바의 for 문에 해당하는 역할을 하는 액션 태그이다.
	</p>

	<h5>1-1) 자바의 for 구문처럼 사용하기</h5>
	<%--step 속성의 값은 0보다 작거나 같을 수 없다.--%>
	<c:forEach var="i" begin="1" end="6" step="1">
<%--		${i}<br/>--%>
		<h${i}>반복 확인</h${i}>
	</c:forEach>
	
	<%--반복이 종료되면 반복에 사용했던 변수도 삭제된다.--%>
	i : ${i}<br/>

	<h5>1-2) 자바의 향상된 for 구문처럼 사용하기</h5>
	<c:forEach var="color" items="${colors}">
		<span style="color: ${color}; font-size: 20px;" >Hello World</span><br/>
	</c:forEach>

	<h5>1-3) 학생 목록 조회</h5>
	<%
		List<Student> students = new ArrayList<>();
        
        students.add(new Student("홍길동", 24, 80, 80));
        students.add(new Student("이몽룡", 22, 85, 75));
        students.add(new Student("성춘향", 22, 90, 90));
        students.add(new Student("심청이", 20, 85, 85));
        
        request.setAttribute("students", students);
	%>
	
	<table border="1">
		<tr>
			<th>인덱스</th>
			<th>순번</th>
			<th>이름</th>
			<th>나이</th>
			<th>수학 점수</th>
			<th>영어 점수</th>
		</tr>
		<c:forEach var="student" items="${students}" varStatus="status">
			<c:if test="${not status.first}">
				<tr>
					<td>${status.index}</td>
					<td>${status.count}</td>
					<td>${student.name}</td>
					<td>${student.age}</td>
					<td>${student.math}</td>
					<td>${student.english}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<h4>1) c:forTokens 액션 태그</h4>
	<p>
		문자열에 포함된 구분자를 통해 토큰을 분리해 반복을 수행하는 액션 태그이다.
	</p>
	<ol>
		<c:forTokens var="device" items="컴퓨터,노트북 에어컨/TV,냉장고.세탁기" delims=",/. ">
			<li>${device}</li>
		</c:forTokens>
	</ol>

	<h3>5. c:url 액션 태그</h3>
	<p>
		URL을 생성하고 쿼리스트링을 미리 설정하는 액션 태그이다.
	</p>

	<c:url var="url" value="/views/el/elParam.jsp">
		<c:param name="pName" value="아이폰"/>
		<c:param name="pCount" value="15"/>
		<c:param name="pOption" value="블랙티타늄"/>
		<c:param name="pOption" value="256GB"/>
	</c:url>
	
	<a href="${url}">View Details</a>
</body>
</html>
