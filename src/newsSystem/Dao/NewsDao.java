package newsSystem.Dao;
import java.sql.*;
import java.util.*;

import newsSystem.Bean.News;
import newsSystem.Bean.Title;
public class NewsDao {
   public int getCount(){
       Connection conn=null;
	   PreparedStatement psmt = null;
	   ResultSet rs = null; 
	   int all =0;
	   try{ 
	  	   Class.forName("com.mysql.jdbc.Driver");
	  	   conn = DriverManager.getConnection 
	  	   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	  	   String sql = "select count(*) from news";
	  	   psmt=conn.prepareStatement(sql);
	  	   rs = psmt.executeQuery(); 
	  	   while(rs.next()){
	  		   all=rs.getInt(1);
	  	   }
	  	   conn.close();psmt.close();rs.close();
	   }
	   catch(Exception e){
		   e.printStackTrace(); 
	   }
	   return all; 
  }
       
   public List showList(int start,int end){
	   Connection conn=null;
	   PreparedStatement psmt = null;
	   ResultSet rs = null; 
	   boolean bol=false;
	   List nl=new ArrayList();    
	   try{ 
		   Class.forName("com.mysql.jdbc.Driver");
		   conn = DriverManager.getConnection 
		   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
		   //查询nid在start,end之间的新闻
		   String sql = "select * from news where nid between ? and ? order by nid asc";
		   psmt=conn.prepareStatement(sql);
		   psmt.setInt(1, start);
		   psmt.setInt(2, end);
		   rs = psmt.executeQuery();
		   //News news=null;
		   while(rs.next()){
			   News news=new News();
			   news.setNid(rs.getInt("nid"));
			   news.setWriter(rs.getString("nathor"));
			   news.setTitle(rs.getString("ntitle"));
			   news.setNcreatedate(rs.getTimestamp("ncreatedate"));
			   news.setAbst(rs.getString("nsummary"));
			   //将news加入List nl
			   nl.add(news);  
	  	 	}
		    conn.close();psmt.close();rs.close();
	  	 }     
	   catch(Exception e){
		   e.printStackTrace();
	   }
       return nl;
  }
	    
	public int addNews(News news){
		Connection con=null;
		Statement stmt = null;
		ResultSet rs = null;
		int v=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection 
			("jdbc:mysql://localhost:3306/newsdb","root","admin");
			stmt = con.createStatement();
			String str = "insert news values(null,'"+news.getBmon()+"','"+news.getTitle()+"','"+news.getWriter()+"',null,'"+news.getPicpath()+"','"+news.getContent()+"',null,'"+news.getAbst()+"')";
			v = stmt.executeUpdate(str);
			if(rs.next())
				v  = 1;
	    		con.close();stmt.close();rs.close();
		}    	
		catch(Exception e){
			e.printStackTrace();
		} 
	    return v;
   }
	    
	 public List chooseTopic(){
	     Connection con=null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 //设置List nl
		 List nl=new ArrayList();
		 try{ 
		  	 Class.forName("com.mysql.jdbc.Driver");
		  	 Connection conn = DriverManager.getConnection 
		  	 ("jdbc:mysql://localhost:3306/newsdb","root","admin");
		  	 stmt = conn.createStatement();
		  	 String sql = "select * from topic";
		  	 int maxid =0;
		  	 rs = stmt.executeQuery(sql);
		  	 while(rs.next()){
		  		 Title title=new Title();
		  		 title.setTid(rs.getInt(1));
		  		 title.settName(rs.getString(2));  
		  		 //把title加入List nl中
		  		 nl.add(title);  
		  	 }  
		  	 conn.close();stmt.close();rs.close();
		 }     
		 catch(Exception e){
		  	 e.printStackTrace();
		 }  
		 return nl;
  }
	      
	      public List titleList(){
	    	  Connection con=null;
		  	  Statement stmt = null;
		  	  ResultSet rs = null;
		  	  List nl=new ArrayList();
		  	  Title title=null;
		  	  try{ 
		  		  Class.forName("com.mysql.jdbc.Driver");
		  		  Connection conn = DriverManager.getConnection 
		  		  ("jdbc:mysql://localhost:3306/newsdb","root","admin");
		  		  stmt = conn.createStatement();
		  		  String sql = "select * from topic";
		  		  int maxid =0;
		  		  rs = stmt.executeQuery(sql);
		  		  while(rs.next()){ 
		  			  			   title=new Title();
		  			  			   title.setTid(rs.getInt("tid"));
		  			  			   title.settName(rs.getString(2));
		  			  			   nl.add(title); 
		  		  }  
		  		  conn.close();stmt.close();rs.close();
		  	  }     
		  	  catch(Exception e){
		  		  e.printStackTrace();
		  	  }
		  	  	  return nl;
  }
	      
	      public int addTitle(Title title){
	    	  Connection con=null;
	    	  Statement stmt = null;
	    	  ResultSet rs = null;
	    	  int v=0;
	    	  try{
	    		  Class.forName("com.mysql.jdbc.Driver");
	    		  Connection conn = DriverManager.getConnection 
	    		  ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	    		  stmt = conn.createStatement();
	    		  String str = "select max(tid) from topic";
	    		  rs = stmt.executeQuery(str);
	    		  int maxid =0;
	    		  if(rs.next())
	    			maxid = rs.getInt(1)+1;
	    		  	String sql = "insert topic values("+ maxid + ",'"+title.gettName()+"')";
	    		  	v  = stmt.executeUpdate(sql);
	   		      conn.close();stmt.close();rs.close();
	   		  }     
	    	  catch(Exception e){
	    		  e.printStackTrace();
	    	  }
	   	      	  return v;
  }
	      
		  public News getNewsById(int id){
	    	  Connection con=null;
	    	  PreparedStatement pstmt = null;
	    	  ResultSet rs = null;
	    	  News news=null;
	    	  try{
	    	      Class.forName("com.mysql.jdbc.Driver");
		  		  con = DriverManager.getConnection 
		  		  ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
		  		  String sql = "select * from news where nid=?";
		  		  pstmt=con.prepareStatement(sql);
		  		  pstmt.setInt(1,id);
		  		  rs = pstmt.executeQuery();
		  		  if(rs.next()){
		  			            news=new News();
		  			            news.setNid(id);
		  			            news.setNid(rs.getInt("nid"));
		  			            news.setBmon(rs.getInt("ntid"));
		  			            news.setTitle(rs.getString("ntitle"));
		  			            news.setWriter(rs.getString("nathor"));
		  			            news.setNcreatedate(rs.getTimestamp("ncreatedate"));
		  			            news.setContent(rs.getString("ncontent"));
		  			            news.setAbst(rs.getString("nsummary"));
		  			}
		  		       con.close();pstmt.close();rs.close();
		  	   }     
		  	   catch(Exception e){
		  		   e.printStackTrace();
		  	   }
	             return news;
          }
		  
		  public List getNewsAll(){
	    	  Connection con=null;
	    	  Statement stmt = null;
	    	  ResultSet rs = null;
	    	  News news=null;
	    	  List list=new ArrayList();
	    	  try{
	    	      Class.forName("com.mysql.jdbc.Driver");
	   		      con = DriverManager.getConnection 
	   		      ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	   		      stmt = con.createStatement();
	   		      String str = "select * from news";
	              rs = stmt.executeQuery(str);
	   		      while(rs.next()){
	   		        	           news=new News();
			                       news.setNid(rs.getInt("nid"));
			                       news.setTitle(rs.getString("ntitle"));
			                       news.setWriter(rs.getString("nathor"));
			                       news.setNcreatedate(rs.getTimestamp("ncreatedate"));
			                       news.setContent(rs.getString("ncontent"));
			                       news.setAbst(rs.getString("nsummary"));
			                       list.add(news);
			      }     
	   		      con.close();stmt.close();rs.close();
		  	  }  
		  	  catch(Exception e){
		  		  e.printStackTrace();
		  	  }
	             return list;
	}
		  
		  public int editNews(News news){
	    	   Connection con=null;
	    	   PreparedStatement pstmt = null;
	     	   ResultSet rs = null;
	     	   int v=0;
	     	   try{
	     		   Class.forName("com.mysql.jdbc.Driver");
	    		   con = DriverManager.getConnection 
	    		   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	     		   String sql ="update news SET ntid=?,ntitle=?,nathor=?,ncontent=?,nsummary=? WHERE nid=?";
	     		   pstmt=con.prepareStatement(sql);
	     		   pstmt.setInt(1,news.getBmon());
	     		   pstmt.setString(2,news.getTitle());
	     		   pstmt.setString(3,news.getWriter());
	     		   pstmt.setString(4,news.getContent());
	     		   pstmt.setString(5,news.getAbst());
	     		   pstmt.setInt(6,news.getNid());
	    		   v = pstmt.executeUpdate();
	    		   if(rs.next())
	    		       v  = 1;
	    		       con.close();pstmt.close();rs.close();
	    		    }    
	     	   catch(Exception e){
	     		   e.printStackTrace();
	     	   } 
	    	   return v;
	           } 
		  
		  public int deleteNews(News news){
			  Connection con=null;
	    	  PreparedStatement pstmt = null;
	     	  ResultSet rs = null;
	     	  int v=0;
	     	  try{
	     		  Class.forName("com.mysql.jdbc.Driver");
	    		  con = DriverManager.getConnection 
	    		  ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	     		  String sql ="delete from news where nid=?";
	     		  pstmt=con.prepareStatement(sql);
	     		  pstmt.setInt(1,news.getNid());
	    		  v = pstmt.executeUpdate(); 
	    		  con.close();pstmt.close();rs.close();
	    	  }    
	     	  catch(Exception e){
	     		  e.printStackTrace();
	     	  } 
	    	  return v;
		  } 
		  
		  public List showNewsByTitle(News news){
			  Connection con=null;
	    	  PreparedStatement pstmt = null;
	     	  ResultSet rs = null;
	     	  List li=new ArrayList();
	     	  News n=null;
	     	  try{
	     		  Class.forName("com.mysql.jdbc.Driver");
	    		  con = DriverManager.getConnection 
	    		  ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	     		  String sql ="select * from news where ntid=? ";
	     		  pstmt=con.prepareStatement(sql);
	     		  pstmt.setInt(1, news.getBmon());
	    		  rs = pstmt.executeQuery();
	    		  while(rs.next()){
	    			               n=new News();
	    			               n.setNid(rs.getInt(1));
	    			               n.setTitle(rs.getString(3));
	    			               n.setAbst(rs.getString(9));
	    			               n.setWriter(rs.getString(4));
	    			               li.add(n);
	    		  }    
	    		  con.close();pstmt.close();rs.close();
	    	   }    
	     	   catch(Exception e){
	     		   e.printStackTrace();
	     	   } 
	    	   return li;
		  }
		  
		  public List showNewsByFrame(News news){
			  Connection con=null;
	    	  PreparedStatement pstmt = null;
	     	  ResultSet rs = null;
	     	  List li=new ArrayList();
	     	  News n=null;
	     	  try{
	     		  Class.forName("com.mysql.jdbc.Driver");
	    		  con = DriverManager.getConnection 
	    		  ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	     		  String sql =" SELECT * FROM news WHERE ntid=? LIMIT 3  ";
	     		  pstmt=con.prepareStatement(sql);
	     		  pstmt.setInt(1, news.getBmon());
	    		  rs = pstmt.executeQuery();
	    		  while(rs.next()){
	    			               n=new News();
	    			               n.setNid(rs.getInt(1));
	    			               n.setTitle(rs.getString(3));
	    			               n.setAbst(rs.getString(9));
	    			               n.setWriter(rs.getString(4));
	    			               li.add(n);
	    		  }    
	    		  con.close();pstmt.close();rs.close();
	    	   }    
	     	   catch(Exception e){
	     		   e.printStackTrace();
	     	   } 
	    	   return li;
		  }
}