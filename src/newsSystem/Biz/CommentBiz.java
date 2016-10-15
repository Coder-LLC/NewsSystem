package newsSystem.Biz;

import java.util.List;

import newsSystem.Bean.Comment;
import newsSystem.Dao.CommentDao;

public class CommentBiz {
	public static List getCommentByNid(int nid){
	   CommentDao cd=new CommentDao();
	   List resulte=cd.getCommentByNid(nid);
	   return resulte;
	}
	
	public static int addComment(Comment comment){
	   CommentDao cd=new CommentDao();
	   int resulte=cd.addComment(comment);
	   return resulte;
	}
	
	public static int deleteComment(Comment comment){
		CommentDao cd=new CommentDao();
		int resulte=cd.deleteComment(comment);
		   return resulte;
	}
}
