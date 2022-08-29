package test.login.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


import test.login.dao.MemberDAO;
import test.login.vo.MemberVO;

public class LoginMember {
	ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
	
	public MemberVO checkMember(String id, String pwd) {
		MemberVO vo = null;
		MemberDAO dao = new MemberDAO();
		try {
			vo = dao.checkMember(id, pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	public void registNewMember(String id, String pwd, String name, String email) {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO(id, pwd, name, email, null);
		memberList.add(vo);
		try {
			dao.insertNewMember(memberList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteMember(String id) {
		MemberDAO dao = new MemberDAO();
		try {
			dao.deleteMember(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void showUpdateMember(String id) {
		MemberDAO dao = new MemberDAO();
		try {
			dao.showUpdateMember(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateMember(String pwd, String name, String email, String joinDate, String id) {
		MemberDAO dao = new MemberDAO();
		try {
			dao.altMemberInfo(pwd, name, email, joinDate, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

