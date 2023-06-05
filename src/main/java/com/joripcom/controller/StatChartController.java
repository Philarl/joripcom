package com.joripcom.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joripcom.service.StatChartService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/chart/*")
@Log4j
public class StatChartController {
	
	@Setter(onMethod_ = {@Autowired})
	private StatChartService statChartService;
	
	@GetMapping("/overall")
	public void overall(Model model) {
		
//		List<StatChartDTO> firstCategoryOrderPrice = statChartService.getFirstCategoryOrderPrice();
//		
//		String firstCategoryData = "[";
//		firstCategoryData += "['1차 카테고리', '매출'], ";
//		
//		for(StatChartDTO dto : firstCategoryOrderPrice) {
//			firstCategoryData += "['" + dto.getCategoryname() + "', " + dto.getOrderprice() + "]";
//			firstCategoryData += ",";
//		}
//		firstCategoryData = firstCategoryData.substring(0, firstCategoryData.lastIndexOf(","));
//		firstCategoryData += "]";
//		
//		model.addAttribute("firstCategoryData", firstCategoryData);
		
	}
	
	@GetMapping("/firstCategoryOrderPrice")
	@ResponseBody
	public ResponseEntity<JSONObject> firstCategoryOrderPrice() {
		ResponseEntity<JSONObject> entity = null;
		
		entity = new ResponseEntity<JSONObject>(statChartService.firstCategoryChart(), HttpStatus.OK);
		
		return entity;
	}

}
