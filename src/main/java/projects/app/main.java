package projects.app;

import java.sql.DriverManager;

import projects.dao.DbConnection;

public class main {

	public static void main(String[] args) {
		DbConnection.getConnection();

	}

}
