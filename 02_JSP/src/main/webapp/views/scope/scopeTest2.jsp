<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-05
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
	pageContext.setAttribute("age", 23);
    request.setAttribute("gender", "남자");
	
	System.out.println(pageContext.getAttribute("age"));
	System.out.println(request.getAttribute("gender"));
    
    // pageContext.forward("scopeTest3.jsp"); // age : null, gender : 남자
    response.sendRedirect("scopeTest3.jsp"); // age : null, gender : null
%>