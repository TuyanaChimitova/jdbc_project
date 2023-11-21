package com.cydeo.jdbctests.day2;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMaps {
    String dbUrl = "jdbc:oracle:thin:@3.94.88.7:1521:XE";
    String dbUsername ="hr";
    String dbPassword = "hr";

    @Test
    public void task1(){
        Map<String,Object> rowMap1 = new HashMap<>();

        System.out.println("------ROW MAP 1-------");
        rowMap1.put("FIRST_NAME","Steven");
        rowMap1.put("LAST_NAME","King");
        rowMap1.put("Salary",24000);

        System.out.println(rowMap1);

        Map<String,Object> rowMap2 = new HashMap<>();

        System.out.println("------ROW MAP 2-------");
        rowMap2.put("FIRST_NAME","Neena");
        rowMap2.put("LAST_NAME","Kochhar");
        rowMap2.put("Salary",17000);


        List<Map<String,Object>> dataList = new ArrayList<>();

        //we will put each of the row map to the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);

        System.out.println(dataList);
        System.out.println(dataList.get(1).get("LAST_NAME"));

    }

    @Test
    public void task2() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES");
        //create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();

        rs.next();// we need to move to first row to fill rowMap1

        Map<String,Object> rowMap1 = new HashMap<>();

        System.out.println("------ROW MAP 1-------");
        rowMap1.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3),rs.getInt(3));

        System.out.println(rowMap1);
        rs.next();// move pointer to second row
        Map<String,Object> rowMap2 = new HashMap<>();

        System.out.println("------ROW MAP 2-------");
        rowMap2.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3),rs.getInt(3));
        System.out.println(rowMap2);

        rs.next();// move pointer to third row
        Map<String,Object> rowMap3 = new HashMap<>();

        System.out.println("------ROW MAP 3-------");
        rowMap3.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap3.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap3.put(rsmd.getColumnName(3),rs.getInt(3));
        System.out.println(rowMap3);


        List<Map<String,Object>> dataList = new ArrayList<>();

        //we will put each of the row map to the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);

        System.out.println(dataList);
        System.out.println(dataList.get(2).get("SALARY"));


        //close connection
        rs.close();
        statement.close();
        conn.close();
    }

    @Test
    public void task3() throws SQLException {
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES WHERE ROWNUM < 6");
        //create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();

        //Create your list of maps to keep information
        List<Map<String,Object>> dataList = new ArrayList<>();

        //how many columns we have
        int columnCount = rsmd.getColumnCount();

        //iterate through each row
        while (rs.next()){
            //create an empty map to hold one row of information
            Map<String,Object> rowMap = new HashMap<>();
            //iterate each column dynamically to fill the map
            for (int i = 1; i <= columnCount; i++) {
                //key = column name, value= column value
                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
            }

            //add the one row information to the list
            dataList.add(rowMap);
        }

        for (Map<String, Object> row : dataList) {
            System.out.println(row);
        }


        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}
