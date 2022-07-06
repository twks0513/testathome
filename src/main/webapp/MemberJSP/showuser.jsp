<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
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
<% request.setCharacterEncoding("utf-8");
MemberDAO dao = new MemberDAO();
ArrayList<MemberDTO> list = dao.getMembers();
%>
<section>

	<H2 id="showh2" align="center">회원목록조회/수정</H2>
	<form action="modifychk.jsp" method="post">
	<div align="center">
		<table border="1">
			<tr>
				<th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
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
				<th><a id="custno" href="modify.jsp?num=<%=dto.getCustno() %>"><%=dto.getCustno() %></a></th><th id="custname"><%=dto.getCustname() %></th><th id="phone"><%=dto.getPhone() %></th><th id="address"><%=dto.getAddress() %></th><th id="joindate"><%=dto.getJoindate() %></th><th id="grade"><%=grade %></th><th id="city"><%=dto.getCity() %></th>
				</tr>
			<%} %>
		</table>	
		</div>
	</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>