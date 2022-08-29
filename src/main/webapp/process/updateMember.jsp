<%@page import="java.sql.Date"%>
<%@page import="test.login.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="test.login.dao.MemberDAO"%>
<%@page import="test.login.service.LoginMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String joinDate = request.getParameter("joinDate");
		LoginMember lm = new LoginMember();
		MemberDAO dao = new MemberDAO();
		lm.updateMember(pwd, name, email, joinDate, id);
		String url = "../process/memberForm.jsp";
		response.sendRedirect(url);
		
	%>
</body>
</html>