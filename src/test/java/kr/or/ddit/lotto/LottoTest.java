package kr.or.ddit.lotto;

import static org.junit.Assert.*;

import java.util.Random;

import org.junit.Test;

import kr.or.ddit.ioc.Lotto;

public class LottoTest {

	@Test
	public void lottoTest() {
		Lotto lotto = new Lotto();
		lotto.setMaxNum(55);
		lotto.setBallSelectNum(6);
		//lotto.excute();
	}
	
}
