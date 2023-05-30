package org.ezen.carrotmarket.domain;

import lombok.Data;

@Data
public class CarAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
