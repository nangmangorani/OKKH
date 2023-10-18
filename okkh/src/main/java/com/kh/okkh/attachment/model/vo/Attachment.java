package com.kh.okkh.attachment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Attachment {

	private int fileNo;
	private int refBno;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String status;
	private String category;
	
}
