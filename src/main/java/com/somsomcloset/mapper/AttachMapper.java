package com.somsomcloset.mapper;

import java.util.List;

import com.somsomcloset.model.AttachImageVO;

public interface AttachMapper {

	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int productId);	
	
}
