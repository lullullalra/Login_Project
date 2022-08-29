<%@page import="test.login.service.LoginMember"%>
<%@page import="test.login.vo.MemberVO"%>
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
		String pwd = request.getParameter("pwd");
		LoginMember lm = new LoginMember();
		MemberVO vo = lm.checkMember(id, pwd);
		String url = "../list/login.html";
		if(vo!=null){
			url = "../process/memberForm.jsp";
		}
		response.sendRedirect(url);
		
	%>
</body>
</html>