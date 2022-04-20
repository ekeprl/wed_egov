package egovframework.let.temp.service.impl;

import egovframework.let.temp.service.TempService;
import egovframework.let.temp.service.TempVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("tempService")
public class TempServiceImpl extends EgovAbstractServiceImpl implements TempService {

       
    @Resource(name="tempMapper")
	private TempMapper tempMapper;
    
    @Resource(name = "tempDAO")
    private TempDAO tempDAO;
    
    @Override
    public TempVO selectTemp(TempVO vo) throws Exception {
    	return tempMapper.selectTemp(vo);
    }
    
    //임시데이터 목록 가져오기
    public List<EgovMap> selectTempList(TempVO vo) throws Exception {
    	return tempMapper.selectTempList(vo);
    }
    
    //id를 받아와야하기 때문에 string
    public String insertTemp(TempVO vo) throws Exception {
    	tempMapper.insertTemp(vo);
    	return null;
    	//null을 리턴받는이유 : insertTemp는 VOID형식이기 때문에 받아올 것이없어서 return null을 사용.
    }
    
    //임시데이터 수정하기
    public void updateTemp(TempVO vo) throws Exception{
    	tempMapper.updateTemp(vo);
    }
    
    //임시데이터 삭제하기
    public void deleteTemp(TempVO vo) throws Exception{
    	tempMapper.deleteTemp(vo);
     }
    //임시데이터 목록 수
    public int selectTempListCnt( TempVO vo) throws Exception {
    	return tempMapper.selectTempListCnt(vo);
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
