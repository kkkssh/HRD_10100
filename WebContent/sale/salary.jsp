<%@page import="java.sql.*"%>
<%@page import="jdbc.util.OracleUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>salary</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<section
		style="position: fixed; top:60px; width: 100%; height: 100%; 
			background-color: lightgray">
	<h3 style="text-align: center">회원 매출 조회</h3>

	<form
		style="display: flex; align-items: center; justify-content: center; text-align: center">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				String grade = "";

				try {
					conn = OracleUtil.getConnection();
					stmt = conn.createStatement();
					String sql = "SELECT me.CUSTNO, me.CUSTNAME, me.GRADE, SUM(mo.PRICE) price "
				            + "FROM MEMBER_TBL_02 me, MONEY_TBL_02 mo "
				            + "WHERE me.CUSTNO = mo.CUSTNO "
				            + "GROUP BY me.CUSTNO, me.CUSTNAME, me.GRADE "
				            + "ORDER BY SUM(mo.PRICE) DESC";

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
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=grade %></td>
				<td><%=rs.getString("price") %></td>
			</tr>

			<%
				} //while이 여기서 닫혀야 함

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