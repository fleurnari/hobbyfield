package com.hobbyfield.app.point.service;

import lombok.Data;

@Data
public class EmojiVO {
	// 이모티콘 
	private Integer pointId;
	private Integer emojiId;
	private String emojiName;
	private String emojiImgName;
	private String emojiImgPath;
}
