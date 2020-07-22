package kr.jboard2.service.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.jboard2.bean.MemberBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("POST")) {
			//파라미터 수신
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			//1,2단계
			Connection conn = DBConfig.getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_LOGIN);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			//4단계
			ResultSet rs = psmt.executeQuery();
			
			//5단계
			MemberBean mb = null;
			if(rs.next()) {
				mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			//6단계
			rs.close();
			psmt.close();
			conn.close();
			//사용자 객체 세션 저장
			if(mb != null) {
				//mb가 null이 아니면=>회원이면 세션에 저장하고 리다이렉트 할꼬야
			HttpSession session = req.getSession();
			session.setAttribute("member", mb);
			//리다이렉트
			return "redirect:/Jboard2/list.do";
			}else {
				//회원이 아닐경우
				return "redirect:/Jboard2/login.do";
			}
			
		}else {
			// GET 요청일때 View forward를 위한 view 정보 리턴
			return "/user/login.jsp";
		}
		
		
	}

}
