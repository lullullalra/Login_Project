<%@page import="java.sql.Date"%>

<%@page import="test.login.dao.MemberDAO"%>
<%@page import="test.login.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="test.login.service.LoginMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript" src="../js/login.js"></script>
<link rel="stylesheet" href="../css/update.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&display=swap" rel="stylesheet">
</head>
<body>
	<form name="frmMember">
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		LoginMember lm = new LoginMember();
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.showUpdateMember(id);
		
		out.print("<html><body><a style='float:left; margin-top:50px'>😊 변경 내용을 꼭 입력해주세요 😊</a><div class='main'>");
		out.print("<h1>Modifying member information</h1><table class='list'><tr align='center' bgcolor='skyblue'>");
		out.print("<td>아이디</td><td>비밀번호</td><td>이름</td><td>email</td><td>가입일</td></tr>");
		MemberVO memberVO = (MemberVO) list.get(0);
		id = memberVO.getId();
		pwd = memberVO.getPwd();
		name =memberVO.getName();
		email = memberVO.getEmail();
		Date joinDate = memberVO.getJoinDate();
		out.print("<tr><td>"+id+"</td><td>"+pwd+"</td><td>"+name+"</td><td>"+email+"</td><td>"+joinDate+"</td></tr>");
		out.print("<tr><td><input type='text' name='id' value='"+id+"' readonly></td><td><input type='password' name='pwd'></td><td><input type='text' name='name'></td><td><input type='text' name='email'></td><td><input type='text' name='joinDate'></td><tr>");
		out.print("</table><input type='button' class='button' value='수정완료' onclick='altMember()'></div></body></html>");
	%>
	</form>
</body>
</html>