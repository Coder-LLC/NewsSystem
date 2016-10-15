package Message.Dao;
import java.sql.*;
import java.util.*;

import Message.Bean.*;
public class MessageDao {
       public int addMessage(Message message){
    	   Connection con=null;
  	       PreparedStatement pstmt = null;
  	       int v=0; 
  	       try{
  	    	   Class.forName("com.mysql.jdbc.Driver");
	  		   con = DriverManager.getConnection 
	  		   ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
	  		   String sql = "insert into message values(null,?,?,?,?,?,null)";
	  		   pstmt=con.prepareStatement(sql);
	  		   pstmt.setString(1, message.getUname());
	  		   pstmt.setString(2, message.getMsgtitle());
	  		   pstmt.setString(3, message.getMsgcontent());
	  		   pstmt.setInt(4, message.getState());
	  		   pstmt.setString(5, message.getSendto());
	  		   v = pstmt.executeUpdate();
	  		   con.close();pstmt.close();
	  		   } 
  	       catch(Exception e){e.printStackTrace();} 
    	   return v;
       }
       
       public int getMessageCount(){
 	       Connection conn=null;
	  	   PreparedStatement psmt = null;
	  	   ResultSet rs = null; 
	  	   int all =0;
	  	   try{ 
	  		   Class.forName("com.mysql.jdbc.Driver");
	  		   conn = DriverManager.getConnection 
	  		   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	  		   String sql = "select count(*) from message";
	  		   psmt=conn.prepareStatement(sql);
	  		   rs = psmt.executeQuery(); 
	  		   while(rs.next()){
	  		         all=rs.getInt(1);
	  		     }
	  		   conn.close();psmt.close();rs.close();
	  	       }
	  	    catch(Exception e){e.printStackTrace(); }
	  	    return all; 
           } 

       public List showMessageList(Message message,int star,int end){
    	   Connection con=null;
  	       PreparedStatement pstmt = null;
  	       ResultSet rs = null;
  	       List li=new ArrayList();
  	       Message msg=null;
  	       try{
	    	   Class.forName("com.mysql.jdbc.Driver");
	  		   con = DriverManager.getConnection 
	  		   ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
	  		   String sql = "select * from message where sendto=? AND msgid between ? and ? order by msgid";
	  		   pstmt=con.prepareStatement(sql);
	  		   pstmt.setString(1, message.getUname());
	  		   pstmt.setInt(2, star);
	  		   pstmt.setInt(3, end);
	  		   rs=pstmt.executeQuery();
	  		   while(rs.next()){
	  			                msg=new Message();
	  			                msg.setMsgid(rs.getInt(1));
	  			                msg.setUname(rs.getString(2));
	  			                msg.setMsgtitle(rs.getString(3));
	  			                msg.setState(rs.getInt(5));
	  			                li.add(msg);
	  		   }
	  		   con.close();pstmt.close();rs.close();
	  		   } 
	        catch(Exception e){e.printStackTrace();} 
  	        return li;
       }
       
        public List getMessageById(Message message){
            Connection con=null;
   	        PreparedStatement pstmt = null;
   	        ResultSet rs = null;
   	        List li=new ArrayList();  	       
   	        try{
 	    	    Class.forName("com.mysql.jdbc.Driver");
 	  		    con = DriverManager.getConnection 
 	  		    ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
 	  		    String sql = "select * from message where msgid=?";
 	  		    pstmt=con.prepareStatement(sql);
 	  		    pstmt.setInt(1, message.getMsgid());
 	  		    rs=pstmt.executeQuery();
 	  		    if(rs.next()){ 
 	  			              message.setUname(rs.getString(2));
 	  			              message.setMsgtitle(rs.getString(3));
 	  			              message.setMsgcontent(rs.getString(4));
 	  			              message.setMsg_creat_date(rs.getTimestamp(7));
 	  			              li.add(message);
 	  		    }
 	  		    con.close();pstmt.close();rs.close();
 	  		    } 
 	         catch(Exception e){e.printStackTrace();} 
   	         return li;     
        }
        
        public int changeState(Message message){
        	 Connection con=null;
    	     PreparedStatement pstmt = null;
    	     int v=0;
    	     try{
    	    	 Class.forName("com.mysql.jdbc.Driver");
  	  		     con = DriverManager.getConnection 
  	  		     ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
  	  		     String sql = "update message set state=? where msgid=?";
  	  		     pstmt=con.prepareStatement(sql);
  	  		     pstmt.setInt(1, 0);
  	  		     pstmt.setInt(2, message.getMsgid());
  	  		     v=pstmt.executeUpdate();
   		         con.close();pstmt.close();       
    	     }
    	     catch(Exception e){e.printStackTrace();} 
    	     return v;
        }
        
        public int deleteMesage(Message message){
			   Connection con=null;
	    	   PreparedStatement pstmt = null;
	     	   ResultSet rs = null;
	     	   int v=0;
	     	   try{
	     		   Class.forName("com.mysql.jdbc.Driver");
	    		   con = DriverManager.getConnection 
	    		   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
	     		   String sql ="delete from message where msgid=?";
	     		   pstmt=con.prepareStatement(sql);
	     		   pstmt.setInt(1,message.getMsgid());
	    		   v = pstmt.executeUpdate();
	    		  }    
	     	   catch(Exception e){e.printStackTrace();} 
	    	   return v;
		  }
}
       