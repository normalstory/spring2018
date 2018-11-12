package kr.or.ddit.rangers.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rangers.model.RangerVo;

@Repository
public class RangersDao implements RangersDaoInf{
	@Resource(name="sqlSessionTemplate")	//dataresouce xml
	private SqlSessionTemplate template;

	@Override
	public List<RangerVo> selectAllrangers() {
		return template.selectList("rangers.selectAllrangers");
	}

	@Override
	public int insertRangers(RangerVo ranger) {
		return template.insert("rangers.insertRangers", ranger);
	}
	
	
}
