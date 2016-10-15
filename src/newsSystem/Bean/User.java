package newsSystem.Bean;
  public class User {
      private int uid;
      private String uname;
      private String upwd;
      private String usex;
      private String email;
      private String uknown;//用户是如何知道本网站的
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUknown() {
		return uknown;
	}
	public void setUknown(String uknown) {
		this.uknown = uknown;
	}
      
}