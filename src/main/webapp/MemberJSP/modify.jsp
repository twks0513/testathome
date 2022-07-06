<%@page import="member.MemberDTO"%>
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
<%@ include file="header.jsp" %>
<section>
<%
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getUser(request.getParameter("num"));
%>
	<div align="center">
		<h2 style="padding: 30px;">홈쇼핑 회원 정보 수정</h2>
		<form action="modifychk.jsp" method="post">
			<table border="1">
				<tr>
					<th>회원번호</th><th><input type="text" name="custno" value="<%=dto.getCustno() %>"></th>
				</tr>
				<tr>
					<th>회원성명</th><th><input type="text" name="custname" value="<%=dto.getCustname() %>"></th>
				</tr>
				<tr>
					<th>회원전화</th><th><input type="text" name="phone" value="<%= dto.getPhone()%>"></th>
				</tr>
				<tr>
					<th>회원주소</th><th><input type="text" name="address" value="<%= dto.getAddress()%>"></th>
				</tr>
				<tr>
					<th>가입일자</th><th><input type="text" name="joindate" value="<%= dto.getJoindate()%>"></th>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th><th><input type="text" name="grade" value="<%= dto.getGrade()%>"></th>
				</tr>
				<tr>
					<th>도시코드</th><th><input type="text" name="city" value="<%= dto.getCity()%>"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정"><button type="button" onclick="location.href='showuser.jsp'">조회</button></th>		
				</tr>
			
			</table>
		
		</form>
	</div>

</section>
<%@include file="footer.jsp" %>
</body>
</html>