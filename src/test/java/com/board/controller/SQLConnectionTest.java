package com.board.controller;

import org.junit.Test;
import java.sql.Connection;
import java.sql.DriverManager;

public class SQLConnectionTest {

    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";

    private static final String USER = "mboard";

    private static final String PASSWORD = "mboard";

    @Test
    public void testConnection() throws Exception {

        Class.forName(DRIVER);

        try(Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Connection" + connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}