package egovframework.let.temp2.service.impl;

import java.util.List;

import egovframework.let.temp2.service.Temp2VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("temp2Mapper")
public interface Temp2Mapper {
	
	//임시데이터 가져오기
	Temp2VO selectTemp(Temp2VO vo) throws Exception;
	//선언되면서 리턴된다.
	
	//임시데이터 목록 가져오기
	List<EgovMap> selectTempList(Temp2VO vo) throws Exception;
	
	//임시데이터 등록
	void insertTemp(Temp2VO vo) throws Exception;
	
	//임시데이터 수정하기
	void updateTemp(Temp2VO vo) throws Exception;
	
	//임시데이터삭제
	void deleteTemp(Temp2VO vo) throws Exception;
	
	//임시데이터 목록 수
	int selectTempListCnt(Temp2VO vo) throws Exception;
	
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