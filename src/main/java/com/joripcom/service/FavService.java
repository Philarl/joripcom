package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.FavoriteVO;
import com.joripcom.dto.FavDTO;

public interface FavService {

	int fav_check(FavoriteVO vo);

	int fav_add(FavoriteVO vo);

	List<FavDTO> fav_list(String u_id);

	int fav_delete(Integer fav_no);

	void fav_empty(String u_id);

}
