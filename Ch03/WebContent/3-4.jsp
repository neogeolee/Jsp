<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-4</title>
</head>
<body>
	<h3>4.회원가입 데이터수신</h3>
	<%
		request.setCharacterEncoding("UTF-8"); //파라미터 수신하기 전에는 utf파일로 인코딩해줘야 한글이 안깨져요
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");//여러개의 데이터이기 때문에 배열로 해요
		String addr = request.getParameter("addr");
	%>
	<p>
		회원가입정보<br/>
		이름 : <%=name %><br/>
		성별 : <%=gender %><br/>
		취미 : 
		<%
			for(String hobby : hobbies){
				out.print(hobby+", ");
			}
		%><br/>
		주소 : <%=addr %><br/>
	</p>
	<a href="./3-2.jsp">뒤로가기</a>

</body>
</html>