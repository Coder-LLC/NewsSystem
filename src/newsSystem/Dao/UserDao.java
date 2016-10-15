package newsSystem.Dao;
import java.sql.*;
import newsSystem.Bean.*;
public class UserDao {
	public int UserRegist(User user){
		   Connection con = null;
	       PreparedStatement pre = null;
	       ResultSet rs = null; 
	       int v=0; 
	       try{
		       Class.forName("com.mysql.jdbc.Driver");
               con =DriverManager.getConnection("jdbc:mysql://localhost:3306/newsdb","root","admin");
		       String sql="insert user values(null,?,?,?,?,?)";
			   pre = con.prepareStatement(sql);
		       pre.setString(1, user.getUname());
			   pre.setString(2, user.getUpwd());
			   pre.setString(3, user.getUsex());
			   pre.setString(4, user.getEmail());
			   pre.setString(5, user.getUknown());
			   v=pre.executeUpdate();
	           con.close();pre.close();rs.close(); 
		      } 
	       catch(Exception e){e.printStackTrace();}   	   
	       return v;
          }
	
	 public boolean UserLogin(User user){
		    Connection con = null;
	        PreparedStatement pre = null;
	        ResultSet rs = null; 
	        boolean bol=false; 
	        try{
		        Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection("jdbc:mysql://localhost:3306/newsdb","root","admin");
		   	    String sql="select * from user where uname=?";
			    pre = con.prepareStatement(sql);
			    pre.setString(1,user.getUname());
			    rs=pre.executeQuery();
	            if(rs.next()&&rs.getString("upwd").equals(user.getUpwd().trim())){
	            bol=true;
	            }
		       } 
	        catch(Exception e){e.printStackTrace();}   	   
	        return bol;
            }
}
