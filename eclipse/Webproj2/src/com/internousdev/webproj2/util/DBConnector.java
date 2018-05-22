/**
 *
 */
package com.internousdev.webproj2.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author internousdev
 *
 */
public class DBConnector {

	private static String driverName="com.mysql.jdbc.Driver";

	private static String url="jdbc:mysql://localhost/testdb2";

	private static String password ="mysql";

	private static String user ="root";

	public Connection getConnection(){
		Connection con =null;

		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,password);
			}catch (ClassNotFoundException e){
				e.printStackTrace();
			}catch (SQLException e){
				e.printStackTrace();
			}
		return con;
	}
}