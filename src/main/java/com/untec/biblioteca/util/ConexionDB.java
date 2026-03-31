package com.untec.biblioteca.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
	
	private static final String URL = "jdbc:mysql://localhost:3306/biblioteca_untec1?useSSL=false&serverTimezone=UTC";

	
	private static final String USER = "root";

	
	private static final String PASS = "Admin1234!";

	public static Connection getConexion() throws SQLException {
		try {
	
			Class.forName("com.mysql.cj.jdbc.Driver");

	
			return DriverManager.getConnection(URL, USER, PASS);

		} catch (ClassNotFoundException e) {
			throw new SQLException("Error: No se encontró el driver de MySQL en el proyecto", e);
		}
	}
}