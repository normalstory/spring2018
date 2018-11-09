package kr.or.ddit.prod.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.config.db.SqlFactoryBuilder;
import kr.or.ddit.prod.model.ProdVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

@Repository
public class ProdDao implements ProdDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<ProdVo> prodList() {
		return template.selectList("prod.prodListAll");
	}

	@Override
	public ProdVo prodDetail(String prod_id) {
		return (ProdVo)template.selectOne("prod.prodDetail",prod_id);
	}

	@Override
	public List<ProdVo> prodPageList(PageVo pageVo) {
		return template.selectList("prod.prodPageList",pageVo);
	}

	@Override
	public int getProdCnt() {
		return template.selectOne("prod.getUsetCnt");
	}

}
