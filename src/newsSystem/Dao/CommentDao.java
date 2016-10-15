package newsSystem.Dao;
import java.sql.*;
import java.util.*;

import newsSystem.Bean.Comment;
public class CommentDao {
       public List getCommentByNid(int nid){
    	      Connection con=null;
  	          PreparedStatement pstmt = null;
  	          ResultSet rs = null;
  	          List li=new ArrayList();
  	          try{
  	    	      Class.forName("com.mysql.jdbc.Driver");
	  		      con = DriverManager.getConnection 
	  			  ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
	  		      String sql = "select * from comment where cnid=?";
	  		      pstmt=con.prepareStatement(sql);
	  		      pstmt.setInt(1,nid);
	  		      rs = pstmt.executeQuery();
	  		      while(rs.next()){
	  		    	   Comment comment=new Comment();
	  		    	   comment.setCid(rs.getInt("cid"));
	  			       comment.setCnid(nid);
	  			       comment.setCathor(rs.getString("cathor"));
	  			       comment.setCcontent(rs.getString("ccontent"));
	  			       comment.setCdate(rs.getTimestamp("cdate"));
	  			       comment.setCip(rs.getString("cip"));
	  			       li.add(comment);
	  			  }
	  		      con.close();pstmt.close();rs.close();
	  		     }     
	  	     catch(Exception e){e.printStackTrace();}
             return li;
       }
       
       public int addComment(Comment comment){
 	          Connection con=null;
	          PreparedStatement pstmt = null;
	          int v=0;
	          try{
	    	       Class.forName("com.mysql.jdbc.Driver");
	  		       con = DriverManager.getConnection 
	  			   ("jdbc:mysql://localhost:3306/newsdb","root","admin"); 
	  		       String sql = "insert into comment values(null,?,?,null,null,?)";
	  		       pstmt=con.prepareStatement(sql);
	  		       pstmt.setInt(1, comment.getCnid());
	  		       pstmt.setString(2, comment.getCcontent());
	  		       pstmt.setString(3, comment.getCathor());
	  		       v = pstmt.executeUpdate();	                
	  		       con.close();pstmt.close();
	  		      }     
	  	     catch(Exception e){e.printStackTrace();}
             return v;
       }
       
       public int deleteComment(Comment comment){
    	   Connection con=null;
    	   PreparedStatement pstmt = null;
    	   int v=0;
     	   try{
     		   Class.forName("com.mysql.jdbc.Driver");
    		   con = DriverManager.getConnection 
    		   ("jdbc:mysql://localhost:3306/newsdb","root","admin");
     		   String sql ="delete from comment where cid=?";
     		   pstmt=con.prepareStatement(sql);
     		   pstmt.setInt(1,comment.getCid());
    		   v = pstmt.executeUpdate(); 
    		   con.close();pstmt.close();
    		  }    
     	   catch(Exception e){e.printStackTrace();} 
    	   return v;
       }
}
