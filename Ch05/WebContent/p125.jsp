<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버정보출력</title>
</head>
<body>
	서버정보 : <%= application.getServerInfo() %><br/>
	서블릿규약 메이저버전 : <%= application.getMajorVersion() %><br/>
	서블릿규약 마이너버전 : <%= application.getMinorVersion() %>

</body>
</html>