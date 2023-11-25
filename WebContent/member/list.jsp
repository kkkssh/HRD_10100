<%@page import="java.sql.*"%>
<%@page import="jdbc.util.OracleUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section
		style="position: fixed; top:60px; width: 100%; height: 100%; 
			background-color: lightgray">
	<h3 style="text-align: center">회원 목록 조회/수정</h3>

	<form
		style="display: flex; align-items: center; justify-content: center; text-align: center">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>

			</tr>

			<%
				Connection conn = null;
				Statement stmt = null;
				String grade = "";
				
				try {
					conn = OracleUtil.getConnection();
					stmt = conn.createStatement();
					String sql = "SELECT * FROM MEMBER_TBL_02 ORDER BY CUSTNO";
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
						grade = rs.getString("grade");
						switch (grade) {
						case "A":
							grade = "VIP";
							break;
						case "B":
							grade = "일반";
							break;
						case "C":
							grade = "직원";
							break;

						}
			%>

			<tr>
				<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=rs.getDate("joindate")%></td>		<!-- getString은 yyyy-MM-dd hh:mm:ss 형식으로 출력한다. -->
				<td><%=grade%></td>
				<td><%=rs.getString("city")%></td>

			</tr>

			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

		</table>


	</form>


	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>