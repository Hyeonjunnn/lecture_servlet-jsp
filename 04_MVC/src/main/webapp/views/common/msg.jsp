<%--
  Created by IntelliJ IDEA.
  User: Playdata
  Date: 2025-02-10
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<script>
	alert("${msg}");
    
    location.replace("${pageContext.request.contextPath}${location}");
</script>

</body>
</html>
