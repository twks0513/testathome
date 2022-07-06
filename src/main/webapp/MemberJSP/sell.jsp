<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../MemberCSS/MemberCSS.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<% request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO() ;
		ArrayList<MemberDTO> list = dao.sell();
	%>

	<H2 id="sellh2" align="center">회원매출조회</H2>
	<form action="modifychk.jsp" method="post">
	<div align="center">
		<table border="1">
			<tr>
				<th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
			</tr>
			<% String grade ="";
			for(MemberDTO dto :list){
				if(dto.getGrade().equals("A")){
					grade ="VIP";
				}else if(dto.getGrade().equals("B")){
					grade = "일반";
				}else if(dto.getGrade().equals("C")){
					grade = "직원";
				}
			%>
			<tr>
				<th><%=dto.getCustno() %></th><th><%=dto.getCustname() %></th><th><%=grade %></th><th><%=dto.getPrice() %></th>
				</tr>
			<%} %>
		</table>	
		</div>
	</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>