package newsSystem.Biz;

import java.util.List;

import newsSystem.Bean.News;
import newsSystem.Bean.Title;
import newsSystem.Dao.NewsDao;

public class NewsBiz {
	   public static int getCount(){
		  NewsDao nd=new NewsDao();
		  int result=nd.getCount();
		  return result;
	      }
	   
	   public static List showList(int start,int end){
		  NewsDao nd=new NewsDao();
		  List result=nd.showList(start, end);
		  return result;
	      }
	   
	   public static int addNews(News news){
		  NewsDao nd=new NewsDao();
		  int result=nd.addNews(news);
		  return result;
		  }
	   
	   public static List chooseTopic(){
		  NewsDao nd=new NewsDao();
		  List result=nd.chooseTopic();
		  return result;
	      }
	   
	   public static List titleList(){
		  NewsDao nd=new NewsDao();
		  List result=nd.titleList();
		  return result;
		  }
	   
	   public static int addTitle(Title title){
		  NewsDao nd=new NewsDao();
		  int result=nd.addTitle(title);
		  return result;
		  }
	   
	   public static News getNewsById(int id){
		  NewsDao nd=new NewsDao();
		  News result=nd.getNewsById(id);
		  return result;
		  }
	   
	   public static List getNewsAll(){
		  NewsDao nd=new NewsDao();
		  List result=nd.getNewsAll();
		  return result;
		  }
	   
	   public static int editNews(News news){
		   NewsDao nd=new NewsDao();
		   int result=nd.editNews(news);
		   return result;
	   }
	   
	   public static int deleteNews(News news){
		   NewsDao nd=new NewsDao();
		   int result=nd.editNews(news);
		   return result;
	   }
	   
	   public static List showNewsByTitle(News news){
		   NewsDao nd=new NewsDao();
		   List result=nd.showNewsByTitle(news);
		   return result;
	   }
	   
	   public static List showNewsByFrame(News news){
		   NewsDao nd=new NewsDao();
		   List result=nd.showNewsByFrame(news);
		   return result;
	   }
}
