package user_complaints;

import java.io.Serializable;

public class ComplaintBean implements Serializable 
{
	private int transid,cid;
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	private String status=null;
	private String complaint_description=null;
	private String admin_reply=null;
	
	public int getTransid() {
		return transid;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdmin_reply() {
		return admin_reply;
	}
	public void setAdmin_reply(String admin_reply) {
		this.admin_reply = admin_reply;
	}
	public void setTransid(int transid) {
		this.transid = transid;
	}
	public String getComplaint_description() {
		return complaint_description;
	}
	public void setComplaint_description(String complaint_description) {
		this.complaint_description = complaint_description;
	}
}
