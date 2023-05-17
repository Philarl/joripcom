package com.joripcom.domain;

import com.joripcom.domain.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	
	private boolean prev, next;
	
	private int total;
	
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.cri = cri;
		this.total = total;
		
		int pageSize = 10;
		int endPageInfo = pageSize - 1;
		
		this.endPage = (int) Math.ceil(cri.getPageNum() / (double) pageSize) * pageSize;
		this.startPage = this.endPage - endPageInfo;
		
		int realEnd = (int) Math.ceil((total * 1.0) / cri.getAmount());
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
	}

}