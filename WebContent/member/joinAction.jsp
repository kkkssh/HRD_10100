<%@page import="java.sql.*"%>
<%@page import="jdbc.util.OracleUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinAction</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");	//한글 제대로 나오게 하기

	Connection conn = null;
	Statement stmt = null;
	String mode = request.getParameter("mode");
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
/* 	String joindate = request.getParameter("joindate"); */
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	try{
		
		conn = OracleUtil.getConnection();
		stmt = conn.createStatement();
		String sql = "";
		
		switch(mode){
		case "insert" :
			sql = "INSERT INTO MEMBER_TBL_02 VALUES (" + custno + ", "+
													"'"+ custname +"',"+
													"'"+ phone +"',"+
													"'"+ address +"',"+
													"sysdate,"+
													"'"+ grade +"',"+
													"'"+ city + "')";
			stmt.executeUpdate(sql);
		%>
		<jsp:forward page="join.jsp"></jsp:forward>
		
		<%
			break;
		
		case "modify" :
			sql ="update member_tbl_02 set "+
					"custname = '"+ custname +"',"+
					"phone = '"+ phone +"',"+
					"address = '"+ address +"',"+					
					"grade = '"+ grade +"',"+
					"city = '"+ city + "' "+
					"where custno = " + custno;
			
			stmt.executeUpdate(sql);
		%>
		<jsp:forward page="modify.jsp"></jsp:forward>
			
		<%
			break;
		
		}
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	


%>

</body>
</html>