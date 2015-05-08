package exam.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<h1>회원 상세페이지</h1><hr>");
		
		String id = request.getParameter("id");
		
		// out.print(id);
		
		// 1. JDBC 드라이버 로드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. 데이터베이스와 연결
		Connection con = null; // try안에 있는 것을 밖으로 빼줌
		
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jspuserc", "jsp1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 3. SQL문 실행
		PreparedStatement pstmt = null;
		String sql = "select * from member where id=?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery(); // executeQuery는 select문을 사용할 때
			
			if(rs.next()) {
				out.print("<table border=1>");
				out.print("<tr>");
				
				out.print("<td>아이디</td>");
				out.print("<td>"+ rs.getString("id") +"</td>");
				out.print("</tr>");
				
				out.print("<tr>");
				out.print("<td>이름</td>");
				out.print("<td>"+ rs.getString("name") +"</td>");
				out.print("</tr>");
				
				out.print("</table>");
				
				out.print("<a href='delete.jsp?id=" + rs.getString("id") + "'>삭제</a>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
