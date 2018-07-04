//package adminoperations.transaction;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import org.apache.jasper.tagplugins.jstl.core.Catch;
//
//import connection.ProvideDBConn;
//
//public class TransactionResult {
//	Connection conn;
//	public ResultSet getTransactionResult(int ttype) {
//		ResultSet rs=null;
//		try {
//			conn = ProvideDBConn.getCon();
//    PreparedStatement query;
//	query = conn.prepareStatement("select * from transaction where ttid=?");
//	query.setInt(1, ttype);
//    rs = query.executeQuery();
//	}catch(Exception e) {
//		System.out.println(e.toString());
//	}
//	return rs;
//	}
//}
