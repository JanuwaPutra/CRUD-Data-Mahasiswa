/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author User
 */
public class Koneksi {
     public Connection BukaKoneksi()throws SQLException{
        Connection connect;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/mahasiswa", 
                            "root","");
            return connect;        
        }
        catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException exc) {
            
        }
        return null;
    }
    
    
}
