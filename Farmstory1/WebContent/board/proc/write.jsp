<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBconfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");
	
	//Multipart-form 데이터 수신
	String realPath = request.getServletContext().getRealPath("/file"); //업로드파일이 실제로 저장되는곳
	
	int maxFileSize = 1024 * 1024 * 10; //첨부파일 최대 용량(1024*1024 = 1mb *10 = 10mb))
	
	MultipartRequest mRequest = new MultipartRequest(request, realPath, maxFileSize, "utf-8", new DefaultFileRenamePolicy());
	
	String group   = mRequest.getParameter("group");
	String cate    = mRequest.getParameter("cate");
	String uid     = mRequest.getParameter("uid");
	String title   = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname   = mRequest.getFilesystemName("file");
	String regip   = request.getRemoteAddr();
	
	int hasFile = (fname != null) ? 1 : 0; 
	
		// 1, 2단계
		Connection conn = DBconfig.getConnection();

		//트랜젝션 시작(begin)
		conn.setAutoCommit(false); //수동으로 커밋(쿼리를 전송)하겠다 이말이야.
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
		psmt.setString(1, cate);
		psmt.setString(2, title);
		psmt.setString(3, content);
		psmt.setInt(4, hasFile);
		psmt.setString(5, uid);
		psmt.setString(6, regip);
		
		Statement stmt = conn.createStatement();
		
		// 4단계
		psmt.executeUpdate();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_ARTICLE_MAX_SEQ);
		
		// 5단계
		int parent = 0;
		
		if(rs.next()){
			parent = rs.getInt(1);
		}
	
	// 파일을 첨부했을 경우 파일명 코드화
	if(fname != null){
		int i = fname.lastIndexOf("."); //뒤에서 부터 .의 인덱스 값을 구함
		String ext = fname.substring(i);  // 확장자랑 파일이름 구분(.을 기준으로)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_"); //파일 코드화를 위해 날짜로 이름 만들기
		String now = sdf.format(new Date()); 
		
		String newName = now + uid + ext; // 파일명을 날짜랑 아이디로 만들어서 코드화(겹치지않게)
		
		//현재 저장된 첨부 파일명 수정
		File oldFile = new File(realPath+"/"+fname);
		File newFile = new File(realPath+"/"+newName);
		
		oldFile.renameTo(newFile);
		
		
		//3단계
		PreparedStatement psmtFile = conn.prepareStatement(SQL.INSERT_FILE);
		psmtFile.setInt(1, parent);
		psmtFile.setString(2, fname);
		psmtFile.setString(3, newName);
		
		//4단계
		psmtFile.executeUpdate();
		psmtFile.close();
	}
		
		//트랜젝션 끝(실질적인 쿼리 실행)
		conn.commit();
	
		// 6단계
		psmt.close();
		conn.close();
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>





