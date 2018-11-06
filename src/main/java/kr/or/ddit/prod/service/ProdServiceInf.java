package kr.or.ddit.prod.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.prod.model.ProdVo;
import kr.or.ddit.util.model.PageVo;

public interface ProdServiceInf {
	/**
	* Method : prodList
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 전체 제품 리스트 일반 
	*/
	List<ProdVo> prodList();
	
	/**
	* Method : prodDetail
	* 작성자 : pc03
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 제품 상세 페이지 
	*/
	ProdVo prodDetail(String prod_id);
	
	/**
	* Method : prodPageList
	* 작성자 : pc03
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 페이징 처리가된 제품 리스트 출력
	*/
	Map<String,Object> prodPageList(PageVo pageVo);
	
	/**
	* Method : getUsetCnt
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 사용자 제품 수조회
	*/
	int getProdCnt();
}
