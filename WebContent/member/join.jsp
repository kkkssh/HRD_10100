<%@page import="java.sql.*"%>
<%@page import="jdbc.util.OracleUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	
	
	<section
		style="position: fixed; top:60px; width: 100%; height: 100%; 
			background-color: lightgray">
	<h3 style="text-align: center">홈쇼핑 회원 등록</h3>

	<form method="post" action="joinAction.jsp" name="frm"
		style="display: flex; align-items: center; justify-content: center; text-align: center">
		<input type="hidden" name="mode" value="insert">
		
		<table border="1">
		
	<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	Statement stmt = null;
	String custno = "";
	
	try{
		conn = OracleUtil.getConnection();	//DB 연결
		stmt = conn.createStatement();	//sql 실행하기 위한 변수 생성
		String sql = "select max(custno)+1 custno from member_tbl_02";
		ResultSet rs = stmt.executeQuery(sql);	//stmt 통해서 sql 실행 결과
		rs.next();	//1개의 결과물만 출력
		custno = rs.getString("custno");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" name="custno"  value="<%=custno %>"  readonly="readonly"></td>
			</tr>

			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>

			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>

			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address"></td>
			</tr>

			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" disabled="disabled"></td>
			</tr>

			<tr>
				<td>고객등급(A:VIP,B:일반,C:직원)</td>
				<td><input type="text" name="grade"></td>
			</tr>

			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>

			<tr>
				<td colspan="2"> <!-- 열 합치기 -->
				<input type="submit" value="등록" onclick="return joinCheck()">
				<input type="button" value="조회" onclick="return search()">
				</td>
			</tr>

		</table>

	</form>

	</section>

	<jsp:include page="../footer.jsp" />
	
	<script type="text/javascript" src="../js/check.js"></script>

</body>
</html>