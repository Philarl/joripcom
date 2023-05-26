package com.joripcom.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.joripcom.kakaopay.ApproveResponse;
import com.joripcom.kakaopay.ReadyResponse;

@Service
public class KakaoPayService {
	
//	https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#prepare-info
	public ReadyResponse payReady(String cid, Integer partner_order_id, String partner_user_id, String item_name, 
			int quantity, int total_amount, int tax_free_amount, String approval_url, String cancel_url, String fail_url) {
				
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("item_name", item_name);
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(total_amount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", approval_url);
		parameters.add("cancel_url", cancel_url);
		parameters.add("fail_url", fail_url);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		RestTemplate template = new RestTemplate();
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
//	https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-info
	public ApproveResponse payApprove(String cid, String tid, Integer partner_order_id, String partner_user_id, String pg_token) {
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", cid);		
		parameters.add("tid", tid);
		parameters.add("partner_order_id", String.valueOf(partner_order_id));
		parameters.add("partner_user_id", partner_user_id);
		parameters.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, getHeaders());
		
		
		RestTemplate template = new RestTemplate();
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		return approveResponse;
	}
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 3e22f6dc5fabe9dc3b43dee7be3db888");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}

}
