package kr.or.ddit.ioc;

import java.util.HashSet;
import java.util.Set;

public class Lotto {
	int max;
	int num;
	Set<Integer> oh = new HashSet<Integer>();
	
	public Lotto() {}
	
	public int excute(){
		for (int i = 1; i <= num; i++) {
			int w = (int)(Math.random()*max+1);
			oh.add(w);
			if(oh.size()!=i)
				i--;
		}
		System.out.println(oh.toString());
		return oh.size();
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Set<Integer> getOh() {
		return oh;
	}

	public void setOh(Set<Integer> oh) {
		this.oh = oh;
	}

	@Override
	public String toString() {
		return "Lotto [max=" + max + ", num=" + num + ", oh=" + oh + "]";
	}
	
	
}
