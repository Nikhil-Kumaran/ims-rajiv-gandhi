package useroperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class UserSearchProcess {
	Connection conn;
     public ResultSet SearchItem(String brandname,String itemname) {
    	 ResultSet rs=null;
    	 conn = ProvideDBConn.getCon();
    	 PreparedStatement query;
    	 try {
				query=conn.prepareStatement("select * from items where (ibrand LIKE ?) AND (iname LIKE ?)");
	            query.setString(1, brandname+"%");
	            query.setString(2,itemname+"%");
	            rs = query.executeQuery();
    	
     }catch (Exception e) {
		// TODO: handle exception
	}
    	 return rs;
}
}
