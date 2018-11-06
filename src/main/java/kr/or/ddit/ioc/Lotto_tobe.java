package kr.or.ddit.ioc;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Lotto_tobe {
	public static void main(String[] args) {
		int max =55;
		int num =6;
		System.out.println("hi");
	
//		List<Integer> oh = new ArrayList<Integer>();
//		for (int i = 0; i < num; i++) {
//			int w = (int)(Math.random()*max+1);
//			if(oh.contains(w))
//				i-- ; 
//			else 
//				oh.add(w);
//		}
//
//		for(Integer i : oh)
//			System.out.println(i);
//		
//		System.out.println(oh.size());
		

		Set<Integer> oh = new HashSet<Integer>();
		for (int i = 1; i <= num; i++) {
			int w = (int)(Math.random()*max+1);
			oh.add(w);
			if(oh.size()!=i)
				i--;
		}

		for(Integer i : oh)
			System.out.println(i);
		
		System.out.println(oh.size());
	}
}
