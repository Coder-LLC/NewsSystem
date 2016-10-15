package newsSystem.Biz;

import newsSystem.Bean.Admin;
import newsSystem.Dao.AdminDao;

public class AdminBiz {
	 public static boolean adminLongin(Admin admin){
		 AdminDao ld=new AdminDao();
		 boolean result=ld.adminLongin(admin);
		 return result;
	     }
}
