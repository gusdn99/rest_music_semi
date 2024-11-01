package com.itwill.rest.dto.song;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SongLikeDto {
	
	private Integer songId;
	private Integer loginUserId;
	

}
