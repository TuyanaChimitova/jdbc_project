package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {

    public static void main(String[] args) throws SQLException {
        //CONNECTION STRING
        String dbUrl = "jdbc:oracle:thin:@3.94.88.7:1521:XE";
        String dbUsername ="hr";
        String dbPassword = "hr";

        //Create the connection
        //DriverManager class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        //It will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution. It stores only data(there is no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS");

//        //GETTING DATA
//        rs.next();
//        System.out.println("---------FIRST ROW----------");
//            //right now pointer is in the first row.
//
//            //how to get data from first row ?
//            //rs.getInt(index) --> this method returns integer. Index start from 1 in SQL.It refers column position
//            System.out.println(rs.getInt(1));
//            //get the Europe -region name
//            System.out.println(rs.getString(2));
//
//            //same information we can get with columnLabel not column index
//
//            System.out.println(rs.getInt("REGION_ID"));
//            System.out.println(rs.getString("REGION_NAME"));
//
//            //GET ME second row result in following format: 2 - Americas
//        System.out.println("---------SECOND ROW----------");
//        rs.next(); // we need to move pointer to second row.
//
//        System.out.println(rs.getInt(1)+" - "+rs.getString("REGION_NAME"));
//
//        System.out.println("---------THIRD ROW----------");
//        rs.next(); // we need to move pointer to third row.
//        System.out.println(rs.getInt("REGION_ID")+" - "+rs.getString(2));
//
//        System.out.println("---------4TH ROW----------");
//        rs.next(); // we need to move pointer to 4th row.
//        System.out.println(rs.getString("REGION_ID")+" - "+rs.getString(2));

        //what if we have 100 rows, we want to print first and second column

        while (rs.next()){

            System.out.println(rs.getString(1)+" - "+rs.getString(2)+" - "+rs.getString(3));

        }


        //close connection
        rs.close();
        statement.close();
        conn.close();

    }
}
