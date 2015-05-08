<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
    
<%
	
	String id = request.getParameter("id");

	//1. JDBC 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 2. 데이터베이스와 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jspuserc", "jsp1234");
	
	// 3. SQL 실행
	String sql = "delete member where id=?";
		
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 바인딩
	pstmt.setString(1, id);
	
	int result = pstmt.executeUpdate();
	
	// out.print(result);
	
	if(result == 1)
		response.sendRedirect("list");
	
	// 4. 데이터베이스와 연결 끊음
	pstmt.close();
	con.close();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>