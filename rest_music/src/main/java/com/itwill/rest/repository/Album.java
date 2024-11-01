package com.itwill.rest.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Album {
	private String songId;
	private Integer albumId;
	private Integer id; // 회원 번호
	private String title;
	private String songPath;
	private String lyrics;
	private String videoLink;
	private String genreName;

	private String albumName;
	private String albumType;
	private String albumReleaseDate;
	private String albumImage;

	private String artistId;
	private String artistName;

	private String titleSong;

	private Integer likesCount;
}

