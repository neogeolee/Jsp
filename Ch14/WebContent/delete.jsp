<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	
	String host = "jdbc:mysql://192.168.44.46:3306/lth";
	String user = "lth";
	String pass = "1234";
	
	//1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계
	String sql = "DELETE FROM `MEMBER` WHERE `uid` =? ";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, uid);
		
	//4단계
	psmt.executeUpdate();
	//5단계
	//6단계
	psmt.close();
	conn.close();
	//리다이렉트
	response.sendRedirect("./list.jsp");
%>
