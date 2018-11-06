package kr.or.ddit.lotto;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import kr.or.ddit.ioc.Lotto;

public class LottoTest {

	@Test
	public void lottoTest() {
		/***Given***/
		Lotto lotto = new Lotto();
		
		/***When***/
		lotto.setMax(55);
		lotto.setNum(6);
		
		/***Then***/
		assertEquals(6, lotto.excute());
		
	}
}
