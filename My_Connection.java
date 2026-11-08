package college;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class MyConnection {

    public static Connection con;

    public static void ConnectToSQL() {
        try {
            
            String url = "jdbc:sqlserver://localhost:1433;databaseName=College;encrypt=false;trustServerCertificate=true";
            String username = "*****";
            String password = "******";
            con = DriverManager.getConnection(url, username, password);
            System.out.println("CONNECTED SUCCESSFULLY");
        } catch (Exception e) {
            e.printStackTrace(); 
        JOptionPane.showMessageDialog(null, "Connection Failed: " + e.getMessage());
            System.out.println("ERROR Connection");
        }
        }
    public static void Close() {
        try {
           if (con != null)
            con.close();
        } catch (Exception e) {
            System.out.println("ERROR Connection Closing Connection");
        }
    }
public static boolean executeNonquery(String sqlStatement){
try{
ConnectToSQL();
Statement stmt = con.createStatement();
stmt.execute(sqlStatement);
return true;
}catch(Exception e){
    System.out.println(e);
    return false;
}
}
}
