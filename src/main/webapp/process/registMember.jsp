<%@page import="test.login.service.LoginMember"%>
<%@page import="test.login.dao.MemberDAO"%>
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
		MemberDAO dao = new MemberDAO();
		LoginMember lm = new LoginMember();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		lm.registNewMember(id, pwd, name, email);
		String url = "../list/login.html";
		response.sendRedirect(url);
	%>
	
</body>
</html>