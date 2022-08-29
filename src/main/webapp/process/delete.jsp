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
		String id = request.getParameter("id");
	 	LoginMember lm = new LoginMember();
		lm.deleteMember(id);
	%>
	<jsp:forward page="../process/memberForm.jsp"></jsp:forward>
</body>
</html>