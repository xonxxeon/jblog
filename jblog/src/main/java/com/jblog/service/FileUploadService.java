package com.jblog.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class FileUploadService {

	private static String SAVE_PATH = "c:/work/upload";
	private static Logger logger = LoggerFactory.getLogger(FileUploadService.class);
	
	public String store(MultipartFile multipartFile) {
		
		//	실제 파일명 변수
		String saveFilename = "";
		
		try {
			String originalFileName = multipartFile.getOriginalFilename();
			Long size = multipartFile.getSize();
			
			logger.debug("Multipart-원본파일명 : " + originalFileName);
			logger.debug("Multipart-파일사이즈 : " + size);
			
			if(size == 0) {
				logger.debug("파일 미선택으로 기본값 돌려주기");
				return "";
			}
			
			//	확장자 분리
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));
			logger.debug("파일 확장자 : " + extName);
			
			//	저장될 실제 파일명
			saveFilename = getSaveFilename(extName);
			logger.debug("실제 저장될 파일명 : " + saveFilename);
			
			//	멀티파트 파일을 SAVE_PATH 에 저장
			writeFile(multipartFile, saveFilename);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
	
	private String getSaveFilename(String ext) {
		//	실제 저장될 파일명 규칙
		Calendar cal = Calendar.getInstance();
		return String.valueOf(cal.getTimeInMillis() / 1000) + ext.toLowerCase();
	}
	
	private void writeFile(MultipartFile mFile, String saveFilename) throws IOException{
		
		byte[] fileData = mFile.getBytes();
		
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
		
		fos.write(fileData);
		fos.flush();
		fos.close();
	}
	
}
