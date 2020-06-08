<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본객체 속성보기</title>
</head>
<body>
	<%
		Enumeration<String> attrEnum = application.getAttributeNames();
		while(attrEnum.hasMoreElements()){
			String name = attrEnum.nextElement();
			Object value = application.getAttribute(name);
		
	%>
	application 속성 : <b><%= name %></b>= <%= value %><br/>
	<%
		}
	%>

</body>
</html>