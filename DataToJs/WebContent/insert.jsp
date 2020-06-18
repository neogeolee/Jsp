<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");
	String rdate = request.getParameter("rdate");
	
	Connection conn = DBConfig.getConnection();
	PreparedStatement psmt = conn.prepareStatement("INSERT INTO `MEMBER` SET `uid`=?, `name`=?, `hp`=?, `pos`=?, `dep`=?, `rdate`=?");
	psmt.setString(1, uid);
	psmt.setString(2, name);
	psmt.setString(3, hp);
	psmt.setString(4, pos);
	psmt.setString(5, dep);
	psmt.setString(6, rdate);
	
	int result = psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.println(json);
%>