package egovframework.let.temp.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;


public interface TempService {
	
	//임시데이터 가져오기
	public TempVO selectTemp(TempVO vo) throws Exception;
	
	//임시데이터 목록 가져오기
	public List<EgovMap> selectTempList(TempVO vo) throws Exception;
	
	//임시데이터 등록하기
	public String insertTemp(TempVO vo) throws Exception;
	
	//임시데이터 수정하기
	public void updateTemp(TempVO vo) throws Exception;
	
	//임시데이터 삭제하기
	public void deleteTemp(TempVO vo) throws Exception;
	
	
	
	
	/*
	//임시데이터 등록하기
	public String insertTemp(TempVO vo) throws Exception;
	*/
	
	/*
	//임시데이터 목록 수
	public int selectTempListCnt(TempVO vo) throws Exception;
	
	//임시데이터 수정하기
	public void updateTemp(TempVO vo) throws Exception;
	
	//임시데이터 삭제하기
	public void deleteTemp(TempVO vo) throws Exception;
	*/
	
	
	//역시 받은 파일에 전부 담겨져있어 주석처리 후 새로 작성.
	//수정 삭제는 입력이 필요없기 떄문에 void를 씀.
}