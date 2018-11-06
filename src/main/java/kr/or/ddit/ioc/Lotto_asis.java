package kr.or.ddit.ioc;

import java.util.HashSet;
import java.util.Set;

public class Lotto_asis {
	int maxNum;
	int ballSelectNum;
//	Set<Integer> selectNums = new HashSet<Integer>();
	
//	public Set<Integer>[] excute() {
//		do{
//			for(int i =0 ; i<ballSelectNum; i++) {
//				ballSelectNum = (int)(Math.random()*maxNum)+1;
//				selectNums[i].add(ballSelectNum);
//			}
//		}while(selectNums.length>ballSelectNum);
//		return selectNums;
//	}
	
//	public Set<Integer>[] excute() {
//		Set<Integer> set = new HashSet<Integer>();
//		while(selectNums.length>ballSelectNum){
//				ballSelectNum = (int)(Math.random()*maxNum)+1;
//				set.add(ballSelectNum);
//			}
//		};
//		return selectNums;
//	}
	
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getBallSelectNum() {
		return ballSelectNum;
	}
	public void setBallSelectNum(int ballSelectNum) {
		this.ballSelectNum = ballSelectNum;
	}
//
//	public Set<Integer>[] getSelectNums() {
//		return selectNums;
//	}
//
//	public void setSelectNums(Set<Integer>[] selectNums) {
//		this.selectNums = selectNums;
//	}

	
}
