package Message.Biz;
import java.util.List;
import Message.Bean.Message;
import Message.Dao.*;
public class MessageBiz {
       public static int addMessage(Message message){
    	   MessageDao md=new MessageDao();
    	   int result=md.addMessage(message);
    	   return result;
       }
       
       public static List showMessageList(Message message,int star,int end){  
    	   MessageDao md=new MessageDao();
    	   List result=md.showMessageList(message,star,end);
    	   return result;
       }
       
       public static List getMessageById(Message message){
    	   MessageDao md=new MessageDao();
    	   List result=md.getMessageById(message);
    	   return result;
       }
       
       public static int changeState(Message message){
    	   MessageDao md=new MessageDao();
    	   int result=md.changeState(message);
    	   return result;
       }
       
       public static int getMessageCount(){
    	   MessageDao md=new MessageDao();
    	   int result=md.getMessageCount();
    	   return result;
       }
       
       public static int deleteMesage(Message message){
    	   MessageDao md=new MessageDao();
    	   int result=md.deleteMesage(message);
    	   return result;
       }
}
