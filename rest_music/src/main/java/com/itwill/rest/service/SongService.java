package com.itwill.rest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.rest.dto.playlists.AddSongToPlayListDto;
import com.itwill.rest.dto.song.SearchResultDto;
import com.itwill.rest.dto.song.SongDetailDto;
import com.itwill.rest.dto.song.SongLikeDto;
import com.itwill.rest.dto.song.SongSearchDto;
import com.itwill.rest.repository.SongDao;
import com.itwill.rest.dto.song.SongChartDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class SongService {
	private final SongDao songDao;
	
	public SongDetailDto readDetail(int songId) {
		log.debug("id={}",songId);
		
		SongDetailDto dto = songDao.detailBySongId(songId);
		log.debug("dto={}",dto);
		
		return dto;
	}
	
	public boolean likes(SongLikeDto dto) {
		log.debug("serviceLikes{}",dto);
		int result = songDao.isLikes(dto);
		log.debug("dto={}",dto);
		
		if (result == 0) {
			songDao.addLike(dto);
			return true; // 좋아요가 없을경우 생성 후 true 반환
		} else {
			songDao.removeLike(dto);
			return false; // 좋아요가 있을경우 삭제 후 false 반환
			}
		
	}

	public boolean isLikes(SongLikeDto dto) {
		
		int result = songDao.isLikes(dto);
		
		if (result == 0) {
			return true; // 좋아요가 없을경우 생성 후 true 반환
		} else {
			return false; // 좋아요가 있을경우 삭제 후 false 반환
		}
		
	}
	
	public List<SearchResultDto> searchSongs(SongSearchDto dto) {
		if(dto.getStartRow() == null) {
			dto.setStartRow(1);
			dto.setEndRow(10);
		}
		
		List<SearchResultDto> result = songDao.searchSongs(dto);
		for(SearchResultDto dtod : result) {
			log.debug("result={}",dtod);
		}
		return result;
	}
	
	// 특정 사용자가 특정 노래를 좋아요 했는지 여부 확인
	public boolean isUserLikedSong(SongLikeDto dto) {
		log.debug("isUserLikedSong({})", dto);

		int result = songDao.isLikes(dto);

		// 결과를 boolean으로 변환하여 반환
		return result > 0;
	}
	
	// 특정 곡의 좋아요 개수 확인
	public int countSongLikes(Integer songId) {
		log.debug("countSongLikes({})", songId);

		int result = songDao.countSongLikes(songId);
		return result;

	}

	// 좋아요 추가
	public int addSongLike(SongLikeDto dto) {
		log.debug("addSongLike({})", dto);

		int result = songDao.addLike(dto);
		return result;

	}

	// 좋아요 취소
	public int cancelSongLike(SongLikeDto dto) {
		log.debug("cancelSongLike({})", dto);

		int result = songDao.removeLike(dto);
		return result;

	}
	
	// top30
	public List<SongChartDto> readTopSongs(Integer id) {
		log.debug("readTopSongs()");

		List<SongChartDto> list = songDao.getAllSongs();
		return list.stream().limit(30).peek(song -> song.setId(id)).toList();
	}
		
	// 전체 차트
	public List<SongChartDto> readAllSongs(Integer id) {
		log.debug("readAllSongs()");

		List<SongChartDto> list = songDao.getAllSongs();
		return list.stream()
	               .peek(song -> song.setId(id))
	               .toList();
	}

	// 장르별 차트
	public List<SongChartDto> readSongsByGenre(String genreName, Integer id) {
		log.debug("readSongsByGenre({})", genreName);

		List<SongChartDto> list = songDao.getSongsByGenre(genreName);
		return list.stream()
	               .peek(song -> song.setId(id))
	               .toList();
	}

	// top10
	public List<SongChartDto> readTopTenSongs() {
		log.debug("readTopSongs()");

		List<SongChartDto> list = songDao.getAllSongs();
		return list.stream().limit(10).toList();
	}
	// 최신 음악
	public List<SongChartDto> readNewSongs(Integer id) {
		log.debug("readNewSongs()");

		List<SongChartDto> list = songDao.getNewestSongs();
		return list.stream().peek(song -> song.setId(id)).toList();

	}
	// 최신 음악 메인페이지
	public List<SongChartDto> readNewSongsForMain() {
		log.debug("readNewSongsForMain()");

		List<SongChartDto> list = songDao.getNewestSongs();
		return list.stream().limit(10).toList();

	}
	
	// 페이지와 페이지 크기를 받아 해당 페이지의 노래 목록을 반환하는 메서드
	public List<SongChartDto> getSongs(int page, int pageSize) {
        int offset = (page - 1) * pageSize + 1; // OFFSET 구간의 시작
        int end = offset + pageSize - 1; // OFFSET 구간의 끝
        return songDao.findSongs(offset, end);
    }

}
