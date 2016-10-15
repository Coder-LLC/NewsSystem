package newsSystem.Biz;
import newsSystem.Bean.*;
import newsSystem.Dao.*;
public class UserBiz {
	 public static int UserRegist(User user){
			UserDao ud=new UserDao();
			int result=ud.UserRegist(user);
			return result;
		 }
	
	 public static boolean UserLogin(User user){
	    UserDao ud=new UserDao();
	    boolean result=ud.UserLogin(user);
	    return result;
	 }
}
