<%@page import="member.MemberDAO"%>
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
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();  
		int m =0;
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		String custno = request.getParameter("custno");
		
		System.out.println(phone);
		m = dao.modify(custname, phone, address, joindate, grade, city, custno);
		System.out.println(custno);
		
		if(m ==1){%>
			<script type="text/javascript">
				alert('회원정보 수정이 완료 되었습니다!')
				location.href='showuser.jsp'
			</script>
	<% }else if(m ==0){%>
			<script type="text/javascript">
				alert('회원정보 수정에 실패했습니다!')
				history.back()
			</script>	
	<%} %>
	

</body>
</html>