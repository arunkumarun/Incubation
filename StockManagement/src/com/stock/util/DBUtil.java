package com.stock.util;

import java.sql.*;

public class DBUtil {

	public static Connection getDBConnection() throws ClassNotFoundException, SQLException{
		Connection c=null;
		Class.forName("org.postgresql.Driver");
		c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/stockmanagement","postgres","pgsql");
		return c;
	}


}
