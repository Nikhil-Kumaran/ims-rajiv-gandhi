package userchat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class UserChat {
	Connection conn;
	public ResultSet ListTransactions(int uid) {
		conn = ProvideDBConn.getCon();
		ResultSet rs = null;
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement("select distinct transid,userid from chat where userid = ?");
			ps.setInt(1, uid);
			rs = ps.executeQuery();
		}
		catch(Exception e) {
			System.out.println("in userchat listtrans"+e);
		}
		return rs;
	}
	public ResultSet ListMessage(int transid) {
		conn = ProvideDBConn.getCon();
		ResultSet rs = null;
		try {
		PreparedStatement ps = conn.prepareStatement("select user.custid,user.username,chat.transid,chat.message,chat.chat_time,chat.p_type from chat join user on chat.userid=user.custid where chat.transid = ?");
		ps.setInt(1, transid);
		rs = ps.executeQuery();
		}
		catch(Exception e) {
			System.out.println("ListMessage "+e);
		}
		return rs;
	}
}
