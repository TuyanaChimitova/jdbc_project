package com.cydeo.jdbctests.liveclass;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCPractice {
    String dbURL = "jdbc:oracle:thin:@3.94.88.7:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";


    @Test
    public void test1() throws SQLException {

        /*
        HOW TO INIT VARIABLE ?
        -> MAC --> OPT+ENTER
        -> WIN --> ALT+ENTER

         */
        // Driver manager will help us to create connection
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Statement help us to execute any query
        Statement stmnt = conn.createStatement();

        // Resultset will store data after query execution
        ResultSet rs = stmnt.executeQuery("SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES");


        /*

        RETRIVE DATA

         */
        System.out.println("---- FIRST ROW -----");
        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("---- SECOND ROW -----");
        rs.next();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        System.out.println("---- 10TH ROW -----");
        rs.absolute(10);
        System.out.println(rs.getString(1)+" - "+rs.getString(2));


         /*
        What if we have more than 2 row


         */

        ResultSetMetaData rsmd = rs.getMetaData();

        System.out.println("---- HOW MANY COLUMN WE HAVE    -----");
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        System.out.println("---- WHAT ARE COLUMN NAMES    -----");
        System.out.println(rsmd.getColumnName(1));
        System.out.println(rsmd.getColumnName(2));

        System.out.println("---- PRINT ALL COLUMN NAMES DYNAMICALLY   -----");
        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }


        rs.close();

        stmnt.close();

        conn.close();


    }
}



