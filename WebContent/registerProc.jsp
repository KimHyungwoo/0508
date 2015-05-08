<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> <!-- JDBC 클래스는 java.sql 패키지에 포함되어 있기 때문에 반드시 임포트해야 함 -->
<%@ page import = "java.io.*" %>

<%

	// 0. 요청 처리
	request.setCharacterEncoding("UTF-8"); // POST 방식일때 한글처리
	
	String id = request.getParameter("id");
	// out.print(id);
	String pass = request.getParameter("pwd");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	
	// 1. JDBC 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 2. 데이터베이스와 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jspuserc", "jsp1234");
	
	// 3. SQL문 실행
/* 	1) Statement 객체 이용 - 해킹당하기 때문에 사용 안함!!!
 	String sql = "insert into member values('" + id + "','" + pass + "','홍길동',20,'1','서울시','2015-04-17')";
	Statement stmt = con.createStatement();
	int result = stmt.executeUpdate(sql);
	
	out.print(result); */
	
//  2) PreparedStatement 객체 이용
    String sql = "insert into member values(?, ?, ?, ?, ?, ?, default)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 바인딩 - ?부분 채워넣음
	pstmt.setString(1, id);  // 문자열이기때문에 setString 사용
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setInt(4, Integer.parseInt(age)); // 형변환 
	pstmt.setString(5, gender);
	pstmt.setString(6, addr);
	
	int result = pstmt.executeUpdate();
	
	if(result == 1)
		response.sendRedirect("list");
	
	// out.print(result);
	
	// 4. 데이터베이스와 연결 끊음
	// stmt.close();
	pstmt.close();
	con.close();
	
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>