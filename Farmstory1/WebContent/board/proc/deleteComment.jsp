<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="kr.co.farmstory1.config.DBconfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String parent = request.getParameter("parent");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	//1,2단계
	Connection conn = DBconfig.getConnection();
	
	//3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
	psmt.setString(1, seq);
	
	PreparedStatement psmtUpdate = conn.prepareStatement(SQL.DELETE_COMMENT_COUNT);
	psmtUpdate.setString(1, parent);
	
	//4단계
	psmtUpdate.executeUpdate();
	psmt.executeUpdate();
	
	//5단계
	
	//6단계
	psmtUpdate.close();
	psmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("/Farmstory1/board/view.jsp?seq="+parent+"&group="+group+"&cate="+cate);
%>