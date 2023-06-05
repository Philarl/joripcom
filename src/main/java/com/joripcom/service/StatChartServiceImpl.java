package com.joripcom.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.dto.StatChartDTO;
import com.joripcom.mapper.StatChartMapper;

import lombok.Setter;

@Service
public class StatChartServiceImpl implements StatChartService {
	
	@Setter(onMethod_ = {@Autowired})
	private StatChartMapper statChartMapper;

	@Override
	public List<StatChartDTO> getFirstCategoryOrderPrice() {
		
		return statChartMapper.getFirstCategoryOrderPrice();
	}
	
	@Override
	public JSONObject firstCategoryChart() {
		
		List<Map<String, Object>> list = statChartMapper.firstCategoryChart();
		
		JSONObject data = new JSONObject(); 
		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		
		JSONArray title = new JSONArray();
		
		col1.put("label", "1차카테고리이름");
		col1.put("type", "string");
		col2.put("label", "주문금액");
		col2.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for(Map<String, Object> map : list) {
			JSONObject categoryName = new JSONObject();
			categoryName.put("v", map.get("categoryname"));
			JSONObject orderprice = new JSONObject();
			orderprice.put("v", map.get("orderprice"));
			
			JSONArray row = new JSONArray();
			row.add(categoryName);
			row.add(orderprice);
			
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			
			body.add(cell);
		}
		
		data.put("rows", body);
		
		return data;
	}

}
