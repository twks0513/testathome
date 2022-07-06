<%@page import="java.sql.Date"%>
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
	<% request.setCharacterEncoding("utf-8"); 
	MemberDAO dao = new MemberDAO();  
		int r=0;
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
				
		r = dao.register(custname, phone, address, joindate, grade, city);
		
		
		if(r ==1){%>
			<script type="text/javascript">
			alert('회원등록이 완료 되었습니다!')
			history.back()
			</script>
		<%}else{%>
		<script type="text/javascript">
			alert('회원등록에 실패했습니다')
			history.back()
		</script>
		<%}%>

</body>
</html>