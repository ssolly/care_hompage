package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {

	public static final String IMAGE_REPO="C:/spring/image_repo";	//폴더에 대한 경로
	
	public String getMessage(int num, HttpServletRequest request);
	public String saveFile(MultipartFile file);
	
}
