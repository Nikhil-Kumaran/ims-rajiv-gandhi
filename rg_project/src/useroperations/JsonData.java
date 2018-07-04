package useroperations;

public  class JsonData {
	private int custid;
    private String iname;
    private String ibrand;
    private String quantity;
    public JsonData(int i,String a,String b,String j) {
    	this.iname = a;
		this.ibrand = b;
		this.custid = i;
		this.quantity = j;
    }
	public int getCustid() {
		return custid;
	}
	public String getIname() {
		return iname;
	}
	public String getIbrand() {
		return ibrand;
	}
	public String getQuantity() {
		return quantity;
	}

}

