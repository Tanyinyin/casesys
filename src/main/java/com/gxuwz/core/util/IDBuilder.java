package com.gxuwz.core.util;
import java.util.Random;
import java.util.UUID;

/**
 * 生成id   不保证高并发唯一性
 *随机码
 * @author caixb
 */
public class IDBuilder {

	
	/**
	 * 生成id
	 * 
	 * @param code 业务码 会加在id最前面
	 * 
	 * @return
	 */
	public static String getId(String code){
		String extra = getStringRandom(6);
		String time = getNumberRandom(6);
		return code + "-" + time + "-" + extra;
	}
	
	//生成随机数字和字母
    public static String getStringRandom(int length) {  
    	String base = UUID.randomUUID().toString().replaceAll("-", "");     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString().toUpperCase();
    }
    
    //获取uuid
    public static String getUUId() {  
    	return UUID.randomUUID().toString();     
    }
    
    //生成随机数字
    public static String getNumberRandom(int length) {
    	char[] chars = {'1','2','3','4','5','6','7','8','9','0'};
    	StringBuffer sb = new StringBuffer();
        for(int i = 0; i < length; i++){
            sb.append(chars[new Random().nextInt(chars.length)]);
        }
        return sb.toString();
    }  
    
    public static void main(String[] args) {
    	for (int i = 0; i < 100; i++) {
    		System.out.println(getId("YYD"));
		}
    	
	}
}
