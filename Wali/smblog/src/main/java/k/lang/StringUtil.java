package k.lang;

import java.util.Arrays;
import java.util.UUID;

/**
 * 工具类.
 * 
 * @author Ken
 * @since 2014年8月31日
 */
public class StringUtil
{

	/**
	 * 获取随机的UUID.
	 */
	public static String getUUID()
	{
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**指定分隔符分隔标签*/
	public static String[] splitCategory(String s)
	{
		return splitStr(s, ",|\\.| |;|；|，");
	}

	/**指定分隔符分隔*/
	public static String[] splitStr(String s, String reg)
	{
		return s.split(reg);
	}

	public static void main(String[] args)
	{
		System.out.println(Arrays.asList(splitCategory("123 xxx,这是;11；这，楷")));
		System.out.println(Arrays.asList(splitCategory("123")));
	}

}
