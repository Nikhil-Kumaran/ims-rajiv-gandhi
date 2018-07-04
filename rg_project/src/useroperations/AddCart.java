package useroperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class AddCart {
	Connection conn;
    public void addcart(int custid,String iname,String ibrand,int quality) {
   	 conn = ProvideDBConn.getCon();
   	 PreparedStatement query;
   	 try {
				query=conn.prepareStatement("insert into transaction(iid,ttid,custid,quantity) values((select iid from items where iname=? and ibrand = ?),5,?,?)");
				query.setString(1,iname);
				query.setString(2,ibrand);
				query.setInt(3,custid);
	            query.setInt(4,quality);
	            query.executeUpdate();
   	
    }catch (Exception e) {
		System.out.println(e.toString());
	}
}
}
