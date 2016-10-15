package newsSystem.Bean;

import java.sql.Timestamp;

public class News {
      private int bmon;//新闻所属主题编号
      private String title;
      private String writer;
      private String abst;
      private String content;
      private String picpath;
      private int nid;
      private Timestamp ncreatedate;
      public static void News(){}
	public int getBmon() {
		return bmon;
	}
	public void setBmon(int bmon) {
		this.bmon = bmon;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAbst() {
		return abst;
	}
	public void setAbst(String abst) {
		this.abst = abst;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicpath() {
		return picpath;
	}
	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public Timestamp getNcreatedate() {
		return ncreatedate;
	}
	public void setNcreatedate(Timestamp timestamp) {
		this.ncreatedate = timestamp;
	}
	   
}
