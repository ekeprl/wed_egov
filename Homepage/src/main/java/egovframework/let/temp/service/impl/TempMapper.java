package egovframework.let.temp.service.impl;

import java.util.List;

import egovframework.let.temp.service.TempVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("tempMapper")
public interface TempMapper {
	
	//임시데이터 가져오기
	TempVO selectTemp(TempVO vo) throws Exception;
	//선언되면서 리턴된다.
	
	//임시데이터 목록 가져오기
	List<EgovMap> selectTempList(TempVO vo) throws Exception;
	
	//임시데이터 등록
	void insertTemp(TempVO vo) throws Exception;
	
	//임시데이터 수정하기
	void updateTemp(TempVO vo) throws Exception;
	
	//임시데이터삭제
	void deleteTemp(TempVO vo) throws Exception;
	
	/*
	//임시데이터 등록
	//void insertTemp(TempVO vo) throws Exception;
	
	//임시데이터 목록 가져오기
	//List<EgovMap> selectTempList(TempVO vo) throws Exception;
	
	//임시데이터 목록 수
	//int selectTempListCnt(TempVO vo) throws Exception;
	
	//임시데이터 수정하기
	//void updateTemp(TempVO vo) throws Exception;
	
	//임시데이터 삭제하기
	//void deleteTemp(TempVO vo) throws Exception;  
	*/
}


//mapper에서는 동일한 이름의 메서드가 존재하면 안된다.
//받은파일에 다 써있어서 주석처리 후 다시씀.