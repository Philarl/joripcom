package com.joripcom.mapper;

import java.util.List;
import java.util.Map;

import com.joripcom.dto.StatChartDTO;

public interface StatChartMapper {
	// 1차 카테고리별 매출
	List<StatChartDTO> getFirstCategoryOrderPrice();
	// 1차 카테고리별 매출 map으로 받아오기
	List<Map<String, Object>> firstCategoryChart();

}
