package egovframework.let.temp2.service.impl;

import egovframework.let.temp2.service.Temp2Service;
import egovframework.let.temp2.service.Temp2VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("temp2Service")
public class Temp2ServiceImpl extends EgovAbstractServiceImpl implements Temp2Service {

       
    @Resource(name="temp2Mapper")
    private Temp2Mapper temp2Mapper;
    
    @Resource(name = "egovTempIdGnrService") /*이 리소스를 통하여context-idgen.xml을 연결해 값을 가져온다.*/
    private EgovIdGnrService idgenService;
    
    
    @Override
    public Temp2VO selectTemp(Temp2VO vo) throws Exception {
    	return temp2Mapper.selectTemp(vo);
    }
    
    //임시데이터 목록 가져오기
    public List<EgovMap> selectTempList(Temp2VO vo) throws Exception {
    	return temp2Mapper.selectTempList(vo);
    }
    
    //임시데이터 등록하기 (id를 받아와야하기 때문에 string)
    public String insertTemp(Temp2VO vo) throws Exception {
    	String id = idgenService.getNextStringId();
    	vo.setTempId(id);
    	
    	temp2Mapper.insertTemp(vo);
    	return id;
    	//null을 리턴받는이유 : insertTemp는 VOID형식이기 때문에 받아올 것이없어서 return null을 사용.
    	//id로 바꿔줌으로써 id를 반환받는다.
    	//impl에 넣은이유 : impl은 오토커밋이 아닌 오류발생시 롤백이된다./오류가 발생한다면 여태껏 insert한 값이 전부 롤백이된다.(relative 트랜잭션)  -->로직은 impl에서 만들어라! 
    }
    
    //임시데이터 수정하기
    public void updateTemp(Temp2VO vo) throws Exception{
    	temp2Mapper.updateTemp(vo);
    }
    
    //임시데이터 삭제하기
    public void deleteTemp(Temp2VO vo) throws Exception{
    	temp2Mapper.deleteTemp(vo);
     }
    //임시데이터 목록 수
    public int selectTempListCnt( Temp2VO vo) throws Exception {
    	return temp2Mapper.selectTempListCnt(vo);
    }
    
    
    /*
    @Resource(name = "egovTempIdGnrService")
    private EgovIdGnrService idgenService;
    */
    /*
	@Override
	public TempVO selectTemp(TempVO vo) throws Exception {
		return tempMapper.selectTemp(vo);
	}
	
	public String insertTemp(TempVO vo) throws Exception {
		/*
		String id = idgenService.getNextStringId();
		vo.setTempId(id);
		tempMapper.insertTemp(vo);
		
		return id;
		*  /
		
		return null;
	}
	
	//임시데이터 목록 가져오기
	public List<EgovMap> selectTempList(TempVO vo) throws Exception {
		return tempMapper.selectTempList(vo);
	}
	
	//임시데이터 목록 수
	public int selectTempListCnt(TempVO vo) throws Exception {
		return tempMapper.selectTempListCnt(vo);
	}
	
	//임시데이터 수정하기
	public void updateTemp(TempVO vo) throws Exception{
		tempMapper.updateTemp(vo);
	}
	
	//임시데이터 삭제하기
	public void deleteTemp(TempVO vo) throws Exception{
		tempMapper.deleteTemp(vo);
	}
	*/
    /*
	@Override
	public TempVO selectTemp(TempVO vo) throws Exception {
		return tempDAO.selectTemp(vo);
	}
	*/
	
}
