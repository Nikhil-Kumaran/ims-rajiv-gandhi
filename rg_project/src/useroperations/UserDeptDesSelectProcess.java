package useroperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class UserDeptDesSelectProcess {
	Connection conn;
    public ResultSet deptSelect() {
   	 ResultSet rs=null;
   	 conn = ProvideDBConn.getCon();
   	 PreparedStatement query;
   	 try {
				query=conn.prepareStatement("select * from dept");
	            rs = query.executeQuery();
   	
    }catch (Exception e) {
		// TODO: handle exception
	}
   	 return rs;
}
    public ResultSet desSelect() {
      	 ResultSet rs=null;
      	 conn = ProvideDBConn.getCon();
      	 PreparedStatement query;
      	 try {
   				query=conn.prepareStatement("select * from designation");
   	            rs = query.executeQuery();
      	
       }catch (Exception e) {
   		// TODO: handle exception
   	}
      	 return rs;
   }
}
