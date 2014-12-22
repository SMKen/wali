package c.n.z.k.javastudy.clazz;

import java.util.Date;

/**
 * ≤‚ ‘ªÒ»°∏∏¿‡.
 * @author Ken
 * @Since 2014-12-22
 */
public class SuperGetClass extends Date{

	private static final long serialVersionUID = -317507088486358776L;

	public static void main(String[] args) {
		new SuperGetClass().getClazz();
	}
	
	void getClazz(){
		//Object public final native Class<?> getClass();  
		System.out.println(super.getClass().getName()); //c.n.z.k.javastudy.clazz.SuperGetClass
	}
	
}
