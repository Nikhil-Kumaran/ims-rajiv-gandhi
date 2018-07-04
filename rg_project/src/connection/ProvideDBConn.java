package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import static connection.DbData.*;  

public class ProvideDBConn {
	public static Connection getCon(){  
		Connection con=null; 
		try{ 
		
		Class.forName(DRIVER);  
		con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
			
		}catch(Exception e){
			System.out.println("conprovider error:  "+e.toString());
		}  
		
	    return con;  
	}  
	
}
