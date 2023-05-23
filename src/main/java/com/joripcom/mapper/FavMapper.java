package com.joripcom.mapper;

import java.util.List;

import com.joripcom.domain.FavoriteVO;
import com.joripcom.dto.FavDTO;


public interface FavMapper {
	// 찜목록에 상품 존재여부
	int fav_check(FavoriteVO vo);
	// 찜목록 넣기
	int fav_add(FavoriteVO vo);
	// 찜 목록
	List<FavDTO> fav_list(String u_id);
	// 찜목록 빼기
	int fav_delete(Integer fav_no);
	// 찜목록 비우기
	void fav_empty(String u_id);

}
