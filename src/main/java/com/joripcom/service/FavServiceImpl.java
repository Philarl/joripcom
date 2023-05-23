package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.FavoriteVO;
import com.joripcom.dto.FavDTO;
import com.joripcom.mapper.FavMapper;

import lombok.Setter;

@Service
public class FavServiceImpl implements FavService {
	
	@Setter(onMethod_ = {@Autowired})
	private FavMapper favMapper;

	@Override
	public int fav_check(FavoriteVO vo) {
		
		return favMapper.fav_check(vo);
	}

	@Override
	public int fav_add(FavoriteVO vo) {
		
		return favMapper.fav_add(vo);
	}

	@Override
	public List<FavDTO> fav_list(String u_id) {
		
		return favMapper.fav_list(u_id);
	}

	@Override
	public int fav_delete(Integer fav_no) {
		
		return favMapper.fav_delete(fav_no);
	}

	@Override
	public void fav_empty(String u_id) {
		favMapper.fav_empty(u_id);
		
	}

}
