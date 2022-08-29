package test.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import test.login.util.ConnectionManager;
import test.login.vo.MemberVO;

public class MemberDAO {
	
	//회원 정보 수정에서 해당하는 회원 정보 출력(read)
	public ArrayList<MemberVO> showUpdateMember(String id) throws SQLException{
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = ConnectionManager.getConnection();
		String sql = "select*from t_member where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			 id = rs.getString("id");
			 String pwd = rs.getString("pwd");
			 String name =rs.getString("name");
			 String email = rs.getString("email");
			 Date joinDate = rs.getDate("joinDate");
			 MemberVO vo = new MemberVO(id, pwd, name, email, joinDate);
			 vo.setId(id);
			 vo.setPwd(pwd);
			 vo.setName(name);
			 vo.setEmail(email);
			 vo.setJoinDate(joinDate);
			 list.add(vo);
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return list;
	}
	
	
	//조회 기능(read)
	public ArrayList<MemberVO> readMember() throws SQLException {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = ConnectionManager.getConnection();
		String sql = "select*from t_member";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		MemberVO member = null;
		while(rs.next()) {
			member = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
			list.add(member);
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return list;
	}
		
	//로그인 체크 기능
	public MemberVO checkMember(String id, String pwd) throws SQLException {
		MemberVO vo = null;
		Connection con = ConnectionManager.getConnection();
		String sql = "select id,pwd,name,email,joinDate from t_member where id = ? and pwd = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			vo = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return vo;
	}
	
	//회원등록 기능(create)
	 public boolean insertNewMember(ArrayList<MemberVO> list) throws SQLException {
			boolean flag = false;
			Connection con = ConnectionManager.getConnection();
			String sql = "insert into t_member values (?,?,?,?,now())";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			int affectedCount = 0;
			for(MemberVO vo : list) {
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPwd());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getEmail());
				affectedCount = pstmt.executeUpdate();
			}
			if (affectedCount>0) {
				flag = true;
			}
			ConnectionManager.closeConnection(null, pstmt, con);
			return flag;
		}
	
	//회원 삭제 기능(delete)
	public boolean deleteMember(String id) throws SQLException {
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "delete from t_member where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		int affectedCount = 0;
		affectedCount = pstmt.executeUpdate();
		if(affectedCount>0) {
			flag=true;
		}
		ConnectionManager.closeConnection(null, pstmt, con);
		return flag;
	}
	
	public boolean altMemberInfo(String pwd, String name, String email, String joinDate, String id) throws SQLException{
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "update t_member set pwd= ?, name= ?, email= ?, joinDate= ? where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, joinDate);
		pstmt.setString(5, id);
		int affectedCount = 0;
		affectedCount = pstmt.executeUpdate();
		if (affectedCount>0) {
			flag = true;
		}
		ConnectionManager.closeConnection(null, pstmt, con);
		return flag;
	}
}
