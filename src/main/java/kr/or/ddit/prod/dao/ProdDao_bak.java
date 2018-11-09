package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.config.db.SqlFactoryBuilder;
import kr.or.ddit.prod.model.ProdVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

//@Repository
public class ProdDao_bak implements ProdDaoInf{

	@Override
	public List<ProdVo> prodList() {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		List<ProdVo> prodList = session.selectList("prod.prodListAll");
		session.close();
		
		return prodList;
	}

	@Override
	public ProdVo prodDetail(String prod_id) {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		ProdVo prodDetail = (ProdVo)session.selectOne("prod.prodDetail",prod_id);
		session.close();
		
		return prodDetail;
	}

	@Override
	public List<ProdVo> prodPageList(PageVo pageVo) {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		List<ProdVo> prodPageList = session.selectList("prod.prodPageList",pageVo);
		session.close();
		
		return prodPageList;
	}

	@Override
	public int getProdCnt() {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		int totalprodCount = session.selectOne("prod.getUsetCnt");
		session.close();
		
		return totalprodCount;
	}

}
