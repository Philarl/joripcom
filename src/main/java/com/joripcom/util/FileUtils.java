package com.joripcom.util;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
public class FileUtils {
	
	public static String uploadFile(String uploadFolder, String uploadDateFolder, MultipartFile uploadFile) {
		
		String uploadFileName = "";
		
		File uploadFolderPath = new File(uploadFolder, uploadDateFolder);
		
		if(uploadFolderPath.exists() == false) {
			uploadFolderPath.mkdirs();
		}
		
		String uploadClientFileName = uploadFile.getOriginalFilename();
		log.info("파일이름 : " + uploadClientFileName);
		
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString() + "_" + uploadClientFileName;
		log.info("new 파일이름 : " + uploadFileName);
		
		try {
			File saveFile = new File(uploadFolderPath, uploadFileName);
			uploadFile.transferTo(saveFile);
			
			if(checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolderPath, "s_" + uploadFileName));
				
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return uploadFileName;
	}
	
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private static boolean checkImageType(File saveFile) {
		boolean isImage = false;
		
		try {
			String contentType = Files.probeContentType(saveFile.toPath());
			isImage = contentType.startsWith("image");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return isImage;
	}
	
	public static ResponseEntity<byte[]> getFile(String uploadPath, String fileName) throws Exception {
		ResponseEntity<byte[]> entity = null;
		File file = new File(uploadPath, fileName);
		
		if(!file.exists()) return entity;
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return entity;
	}
	
	public static void deleteFile(String uploadPath, String folderName, String fileName) {
		new File((uploadPath + folderName + "/" + fileName).replace('/', File.separatorChar));
		new File((uploadPath + folderName + "/" + "s_" + fileName).replace('/', File.separatorChar));
	}

}
