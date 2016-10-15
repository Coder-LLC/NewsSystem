package newsSystem.Dao;
import java.sql.*;

import newsSystem.Bean.Admin;
public class AdminDao {
       public boolean adminLongin(Admin admin){
    	   Connection con=null;
    	   PreparedStatement pre = null;
    	   ResultSet rs = null;
    	   boolean bol=false;
    	   try{
    		    Class.forName("com.mysql.jdbc.Driver");
    			Connection conn = DriverManager.getConnection 
    			("jdbc:mysql://localhost:3306/newsdb","root","admin");
    			String sql="select * from admin where name=?";
    			pre = conn.prepareStatement(sql);
    			pre.setString(1,admin.getName());
    			rs=pre.executeQuery();
    			 if(rs.next()&&rs.getString("pwd").equals(admin.getPassword().trim())){
    			 bol=true;
    			}
    			 conn.close();pre.close();rs.close();
                }   
    	   catch(Exception e){e.printStackTrace();}
		   return bol;
}
}