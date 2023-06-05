package com.joripcom.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.joripcom.dto.StatChartDTO;

public interface StatChartService {
	
	List<StatChartDTO> getFirstCategoryOrderPrice();
	
	public JSONObject firstCategoryChart();

}
