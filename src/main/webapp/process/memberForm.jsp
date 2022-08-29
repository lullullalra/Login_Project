<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="test.login.dao.MemberDAO"%>
<%@page import="test.login.vo.MemberVO"%>
<%@page import="test.login.service.LoginMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/memberList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&display=swap" rel="stylesheet">
<title>회원 목록 조회</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.readMember();
		out.print("<html><body><div class='main'><h1 style='margin-bottom:100px'>member list</h1>");
		out.print("<table class='list'><tr align='center' bgcolor='skyblue'>");
		out.print("<td class='td'>아이디</td><td class='td'>비밀번호</td><td class='td'>이름</td><td class='td'>이메일</td><td class='td'>가입일</td><td class='td'>삭제</td><td class='td'>수정</td></tr>");
		for(int i = 0; i<list.size(); i++){
			MemberVO memberVO = (MemberVO) list.get(i);
			String id = memberVO.getId();
			String pwd = memberVO.getPwd();
			String name =memberVO.getName();
			String email = memberVO.getEmail();
			Date joinDate = memberVO.getJoinDate();
			out.print("<tr><td>"+id+"</td><td>"+pwd+"</td><td>"+name+"</td><td>"+email+"</td><td>"+joinDate+"</td><td>"
					+"<a href='../process/delete.jsp?&id="+id+"'><button class='button'>삭제</button></a></td><td>"
					+"<a href='../process/update.jsp?&id="+id+"'><button class='button'>수정</button></a></td></tr>");
		}
		out.print("</table><input type='button' class='btn_bottom' value='회원 등록하기' onclick='location.href=\"http://localhost:8080/LoginProject/list/memberForm.html\"'></div></body></html>");
		
	%>
</body>
</html>