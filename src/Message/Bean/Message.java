package Message.Bean;

import java.sql.Timestamp;

public class Message {
       private int msgid;
       private String uname;
       private String msgtitle;
       private String msgcontent;
       private int state;
       private String sendto;
       private Timestamp msg_creat_date;
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getMsgtitle() {
		return msgtitle;
	}
	public void setMsgtitle(String msgtitle) {
		this.msgtitle = msgtitle;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSendto() {
		return sendto;
	}
	public void setSendto(String sendto) {
		this.sendto = sendto;
	}
	public Timestamp getMsg_creat_date() {
		return msg_creat_date;
	}
	public void setMsg_creat_date(Timestamp msg_creat_date) {
		this.msg_creat_date = msg_creat_date;
	}
       
}
