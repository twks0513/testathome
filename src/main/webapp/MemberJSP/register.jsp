<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../MemberCSS/MemberCSS.css" rel="stylesheet">
<script type="text/javascript">
function chkval() {
	let custname = document.joinform.custname.value;
	let phone = document.joinform.phone.value;
	let address = document.joinform.address.value;
	let joindate = document.joinform.joindate.value;
	let grade = document.joinform.grade.value;
	let city = document.joinform.city.value;
	
	
	if(custname==""){
		alert('회원성명이 입력되지 않았습니다')
		joinform.custname.focus()
	}else if(phone==""){
		alert('회원전화가 입력되지 않았습니다')
		joinform.phone.focus()
	}else if(address ==""){
		alert('회원주소가 입력되지 않았습니다')	
		joinform.address.focus()
	}else if(joindate ==""){
		alert('가입일자가 입력되지 않았습니다')
		joinform.joindate.focus()
	}else if(grade =""){
		alert('회원등급이 입력되지 않았습니다')
		joinform.grade.focus()
	}else if(city ==""){
		alert('도시코드가 입력되지 않았습니다')
		joinform.city.focus()
	}else{
		joinform.submit();
	}
}
</script>
</head>
<body>
<%@include file="header.jsp" %>
	<%
		MemberDAO dao = new MemberDAO();
		int custno = dao.lastnum();
	%>
<section>
	<div align="center">
		<h2>홈쇼핑 회원 등록</h2>
		<form name="joinform" action="registerchk.jsp" method="post">
				
			<table border="1">
				<tr>
					<th>회원 번호(자동발생)</th><th><input type="text" value="<%=custno %>"></th>
				</tr>
				<tr>
					<th>회원성명</th><th><input type="text" name="custname"></th>
				</tr>
				<tr>
					<th>회원전화</th><th><input type="text" name="phone"></th>
				</tr>
				<tr>
					<th>회원주소</th><th><input type="text" name="address"></th>
				</tr>
				<tr>
					<th>가입일자</th><th><input type="text" name="joindate"></th>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th><th><input type="text" name="grade"></th>
				</tr>
				<tr>
					<th>도시코드</th><th><input type="text" name="city"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="chkval()">등록</button><button type="button" onclick="location.href='showuser.jsp'">조회</button></th>		
				</tr>
			</table>
		</form>
	</div>
</section>
	<%@include file="footer.jsp" %>
</body>
</html>