package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.*;

public class MemberDao {
	// Connection 객체
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "test20240730";
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
	}
	
	// 회원가입 
	public void join(String id, String pw, String name) throws Exception {
		String sql = "INSERT INTO member(id, pw, name) " + 
				"VALUES (? , ? , ? )" ;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	// 메인페이지 이름과 포인트 가져오기 
	public ArrayList<NamePointDto> namePoint(String id) throws Exception {
		ArrayList<NamePointDto> listRet = new ArrayList<NamePointDto>();
		String sql = "SELECT name, point, pw " + 
				"FROM member " + 
				"WHERE id= ? ";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			 String name = rs.getString("name");
			 int point = rs.getInt("point");
			 String pw = rs.getString("pw");
			 NamePointDto dto = new NamePointDto(name, point, pw);
			 listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return listRet;
	}
	
	// 전체 컬럼 가져오기
	public ArrayList<AdminDto> admin() throws Exception {
		ArrayList<AdminDto> listRet = new ArrayList<AdminDto>();
		String sql = "SELECT id, pw, name, point " + 
					"FROM member";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			 String name = rs.getString("name");
			 int point = rs.getInt("point");
			 String pw = rs.getString("pw");
			 String id = rs.getString("id");
			 AdminDto dto = new AdminDto(name, point, pw, id);
			 listRet.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return listRet;
		
	}
	
	// 삭제하기 
	public void delete(String id) throws Exception {
		String sql = "DELETE FROM member  " + 
				"WHERE id = ? ";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
	}
	
	// 수정 
	public void update(String id, String pw, String name, int point) throws Exception {
		String sql = "update member SET " + 
				"id =  ? , " + 
				"pw = ? , " + 
				"name = ? , " + 
				"point = ? " + 
				"WHERE id = ? ";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, point);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		
	}
	
	
	
	
	
}
