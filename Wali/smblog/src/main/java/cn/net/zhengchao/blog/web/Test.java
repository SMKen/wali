package cn.net.zhengchao.blog.web;

import java.util.Arrays;

public class Test {

	public static void main(String[] args) {
		String str[] = "/smblog/main/".substring("/smblog/main/123/xxx".indexOf("/main/")+"/main/".length()).split("/");
		System.out.println(Arrays.asList(str));
	}
	
}
