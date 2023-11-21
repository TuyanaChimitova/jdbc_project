package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {
    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@3.94.88.7:1521:XE";
    String dbUsername ="hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES WHERE ROWNUM<6");

        //DatabaseMetaData
        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println(dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverName());

        //ResultSetMetaData
        ResultSetMetaData rsmd = rs.getMetaData();

        //how many columns we have ?
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        //get me column name for index 2
        System.out.println(rsmd.getColumnName(1));

        //print all column names dynamically
        System.out.println("-------COLUMN NAMES------");
        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }

        /*
              ResultSet --> it holds table data
                    rs.next() --> it iterate each row dynamically  (with while loop)
                       rs.getString(columnIndex) --> to retrieve data itself
                       rs.getString(columnName)
               ResultSetMetaData --> it holds table information ( ColumnNames - Column Count)
                        rsmd.getColumnCount() --> how many columns we have
                        rsmd.getColumnName(index) --> it will give specific column name

         */

        //write a code, that print whole table information for every query.
        //Column Name - Column value
        //EMPLOYEE_ID - 100
        //FIRST_NAME - Steven

        System.out.println("---------PRINT ALL DATA DYNAMICALLY----------");

        //iterate through each row
        while (rs.next()){
            //whatever we do, we will do for each row.
            //REGION_ID - 1 REGION_NAME - Europe
            //REGION_ID - 2 REGION_NAME - Americas
//            System.out.println(rsmd.getColumnName(1)+"-"+rs.getString(1));
            //iterate each column
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i)+"-"+rs.getString(i)+" ");
            }
            System.out.println();

        }




        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}
