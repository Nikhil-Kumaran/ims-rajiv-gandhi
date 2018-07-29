package useroperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class UserAllTransactions {
	Connection conn;
    public ResultSet Trans(String userid,int type) {
   	 ResultSet rs=null;
   	 conn = ProvideDBConn.getCon();
   	 PreparedStatement query;
   	 System.out.println(userid);
   	 try {
   		 		if(type == 99) {
		   		 	query=conn.prepareStatement("SELECT t.transid,items.ibrand,items.iname,t.quantity,transactiontype.ttname,t.time from (select * from transaction where transaction.custid=?)as t JOIN imsuser.items ON t.iid=items.iid join transactiontype on t.ttid=transactiontype.ttid");
		            query.setInt(1, Integer.parseInt(userid));
		            rs = query.executeQuery();
   		 		}
   		 		else if(type == 2){   
	   		    	query=conn.prepareStatement("SELECT t.transid,items.ibrand,items.iname,t.quantity,transactiontype.ttname,reasontable.reason from (select * from transaction where transaction.custid=? and transaction.ttid=?) as t join imsuser.items ON t.iid=items.iid join transactiontype on t.ttid=transactiontype.ttid join imsuser.reasontable on t.transid=reasontable.transid;");
		            query.setInt(1, Integer.parseInt(userid));
		            query.setInt(2, type);
		            rs = query.executeQuery();
   		 		}
   		 		else {   
	   		    	query=conn.prepareStatement("SELECT t.transid,items.ibrand,items.iname,t.quantity,transactiontype.ttname,t.time from (select * from transaction where transaction.custid=? and transaction.ttid=?)as t JOIN imsuser.items ON t.iid=items.iid join transactiontype on t.ttid=transactiontype.ttid");
		            query.setInt(1, Integer.parseInt(userid));
		            query.setInt(2, type);
		            rs = query.executeQuery();
		 		}
				
				
   		 		
   	
		    }catch (Exception e) {
			System.out.println("error user all transaction::"+e.toString());
			}
   	 return rs;
}
    public ResultSet ret() {
    	 ResultSet rs=null;
    	 conn = ProvideDBConn.getCon();
    	 PreparedStatement query;
    	 try {
 	   		    	query=conn.prepareStatement("select t.ttid,transactiontype.ttname,t.transid,items.iname,items.ibrand,t.time,t.quantity,user.username,user.custid from (select * from transaction where ttid = 6 or ttid =  7 or ttid = 8) as t join items on t.iid = items.iid join user on t.custid = user.custid join transactiontype on t.ttid = transactiontype.ttid");
 		            rs = query.executeQuery();
    	
 		    }catch (Exception e) {
 				System.out.println("error user all transaction::"+e.toString());
 			}
    	 return rs;
 }
    public ResultSet returnStatus(int userid) {
   	 ResultSet rs=null;
   	 conn = ProvideDBConn.getCon();
   	 PreparedStatement query;
   	 try {
	   		    	query=conn.prepareStatement("SELECT t.retid,t.transid,t.retstatus,returnstatus.status,transaction.custid,user.username,items.iid,items.ibrand,items.iname,t.quantity from (select * from returntable) as t join returnstatus on t.retstatus=returnstatus.statusid join transaction on t.transid=transaction.transid join imsuser.items ON transaction.iid=items.iid join user on transaction.custid = user.custid where user.custid = ?");
	   		    	query.setInt(1,userid);
		            rs = query.executeQuery();
   	
		    }catch (Exception e) {
				System.out.println("error user all transaction::"+e.toString());
			}
   	 return rs;
}
    
  
}
