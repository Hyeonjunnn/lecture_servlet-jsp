<%@ page import="com.beyond.eljstl.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-06
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>EL 연산자</title>
</head>
<body>
	<h2>EL 연산자</h2>

	<h3>1. 산술 연산자</h3>
	${10 + 5}<br/>
	${10 - 5}<br/>
	${10 * 5}<br/>
	${10 / 5} 또는 ${10 div 5}<br/>
	${10 % 3} 또는 ${10 mod 3}<br/>

	<h3>2. 논리 연산자</h3>
	${true && false} 또는 ${true and false}<br/>
	${true || false} 또는 ${true or false}<br/>
	${!(10 > 5)} 또는 ${not(10 > 5)}<br/>

	<h3>3. 비교 연산자</h3>
	<h4>1) 숫자 비교 연산</h4>
	<%
		int big = 10;
        int small = 3;
        
        request.setAttribute("big", big);
        request.setAttribute("small", small);
	%>
	
	<%-- Object 타입의 산술 연산은 성립되지 않는다. --%>
	표현식 태그 : <%= (Integer) request.getAttribute("big") + (Integer) request.getAttribute("small") %><br/> <%-- 다운 캐스팅 필요--%>
	<%-- Object 타입의 비교 연산은 성립되지 않는다. --%>
	표현식 태그 : <%= (Integer) request.getAttribute("big") > (Integer) request.getAttribute("small") %><br/> <%-- 다운 캐스팅 필요--%>
	<br/>
	
	<%-- EL은 영역 객체의 속성을 자동으로 형 변환 후 연산을 처리한다. --%>
	EL : ${big + small}<br/>
	EL : ${big > small} 또는 ${big gt small}<br/>
	EL : ${big < small} 또는 ${big lt small}<br/>
	EL : ${big >= small} 또는 ${big ge small}<br/>
	EL : ${big <= small} 또는 ${big le small}<br/>
	EL : ${big == small} 또는 ${big eq small}<br/>
	EL : ${big != small} 또는 ${big ne small}<br/>
	
	<h4>2) 객체의 동등 비교</h4>
	<%
		String str1 = "Hello";
        String str2 = new String("Hello");
		Student student1 = new Student("홍길동", 20, 80, 80);
        Student student2 = new Student("홍길동", 20, 80, 80);
        
        request.setAttribute("str1", str1);
        request.setAttribute("str2", str2);
        request.setAttribute("student1", student1);
        request.setAttribute("student2", student2);
        
	%>
	표현식 태그 : <%= str1 == str2%>, <%= str1.equals(str2) %><br/>
	표현식 태그 : <%= student1 == student2%>, <%= student1.equals(student2) %><br/
	<%-- EL에서 객체의 == 연산은 equal()와 같은 동작을 한다. --%>
	EL : ${str1 == str2}<br/>
	EL : ${str1 != str2}<br/>
	EL : ${student1 == student2}<br/>
	EL : ${student1 != student2}<br/>

	<h4>3) 객체의 null 비교</h4>
	<%
		// String str = null;
		String str = ""; // 빈 문자열의 경우에 empty 연산의 결과는 true이다.
		List<String> names = new ArrayList<>();
    
        // names.add("홍길동");
        
        request.setAttribute("str", str);
        request.setAttribute("names", names);
	%>

	표현식 태그 : <%= str == null %>, <%= names == null %>, <%= names.isEmpty() %><br/>
	EL : ${str == null}, ${names == null}<br/>
	EL : ${empty str}, ${empty names}<br/>
	
</body>
</html>
