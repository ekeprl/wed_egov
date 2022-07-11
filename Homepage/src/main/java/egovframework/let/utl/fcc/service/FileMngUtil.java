package egovframework.let.utl.fcc.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Component("fileMngUtil")
public class FileMngUtil {
   
   public static final int BUFF_SIZE = 2048;
   
   @Resource(name = "propertiesService")
   protected EgovPropertyService propertyService;
   
   @Resource(name = "egovFileIdGnrService")
   private EgovIdGnrService idgenService;
   
   //첨부파일에 대한 목록 정보를 취득한다.
   public List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
	   																													
      int fileKey = fileKeyParam;
      
      //파일저장경로
      String storePathString = "";
      //첨부파일ID
      String atchFileIdString = "";
      
      //파일 저장경로 여부
      if ("".equals(storePath) || storePath == null) {
         storePathString = propertyService.getString("Globals.fileStorePath");   //파일의 기본 저장경로(디폴트값)
      } else {
         storePathString = propertyService.getString(storePath);
      }
      
      //첨부파일ID 생성 및 업데이트 여부
      if ("".equals(atchFileId) || atchFileId == null) {
         atchFileIdString = idgenService.getNextStringId();
      } else {
         atchFileIdString = atchFileId;
      }
      
      //폴더경로 설정
      File saveFolder = new File(storePathString);
      if (!saveFolder.exists() || saveFolder.isFile()) {
         saveFolder.mkdirs(); // mkdir : 폴더를 만드는 명령어
      }
      
      //파일변수
      Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
      MultipartFile file;
      String filePath = "";
      List<FileVO> result = new ArrayList<FileVO>();
      FileVO fvo;
      
      while (itr.hasNext()) {
         Entry<String, MultipartFile> entry = itr.next();
         
         file = entry.getValue();
         String originFileName = file.getOriginalFilename();
         
         //-------------------------------
         // 원 파일명이 없는 경우 처리
         // (첨부가 되지 않은 input file type)
         //-------------------------------
         if("".equals(originFileName)) {
            continue;
         }
         //파일확장자 체크
         int index = originFileName.lastIndexOf(".");           // . 이후에 확장자(어떤확작자인지) 체크
         String fileExt = originFileName.substring(index + 1);
         
         //저장파일명
         String newName = KeyStr + EgovStringUtil.getTimeStamp() + fileKey;  // 첨부파일은 항상 1원본파일명, 2저장파일명이 존재한다.
         
         //파일사이즈
         long size = file.getSize();
         
         //파일저장
         if (!"".equals(originFileName)) {
            filePath = storePathString + File.separator + newName; //separator가 없으면 저장 위치가 꼬인다.
            file.transferTo(new File(filePath)); //로컬 저장
         }
         fvo = new FileVO();
         fvo.setFileExtsn(fileExt);
         fvo.setFileStreCours(storePathString);
         fvo.setFileMg(Long.toString(size));
         fvo.setOrignlFileNm(originFileName);
         fvo.setStreFileNm(newName);
         fvo.setAtchFileId(atchFileIdString);
         fvo.setFileSn(String.valueOf(fileKey));
         
         result.add(fvo);
         
         fileKey++;
      }
      
      return result;
   }
}