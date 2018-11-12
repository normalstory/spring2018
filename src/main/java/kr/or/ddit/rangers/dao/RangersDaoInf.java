package kr.or.ddit.rangers.dao;

import java.util.List;

import kr.or.ddit.rangers.model.RangerVo;

public interface RangersDaoInf {
	List<RangerVo> selectAllrangers();

	int insertRangers(RangerVo ranger);
}
