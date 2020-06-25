<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="kr.co.farmstory1.config.DBconfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	
	//1,2단계
	Connection conn = DBconfig.getConnection();

	//3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
	psmt.setString(1, seq);
	psmt.setString(2, seq);
	
	//4단계
	psmt.executeUpdate();
	
	//5단계
	//6단계
	psmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
	
%>