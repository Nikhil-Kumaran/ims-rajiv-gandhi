package adminchat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ProvideDBConn;

public class AdminChat {
	Connection conn;
	public ResultSet ListTransactions() {
		conn = ProvideDBConn.getCon();
		ResultSet rs = null;
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement("select distinct transid,userid from chat");
			rs = ps.executeQuery();
		}
		catch(Exception e) {
			System.out.println("in adminchat"+e);
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
