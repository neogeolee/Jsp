package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	// DB정보 - 배포용
	//public static final String HOST = "jdbc:mysql://chhak.kr:3306/lth";
	//public static final String USER = "lth";
	//public static final String PASS = "qlfanfkela10121";
	
	// DB정보 - 개발용
	public static final String HOST = "jdbc:mysql://192.168.44.46:3306/lth";
	public static final String USER = "lth";
	public static final String PASS = "1234";
	
	public static Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}	
}


