package com.somsomcloset.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsomcloset.mapper.AttachMapper;
import com.somsomcloset.model.AttachImageVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService{

	@Autowired
	private AttachMapper attachMapper;
	
	
	/* 이미지 데이터 반환 */
	@Override
	public List<AttachImageVO> getAttachList(int productId) {		
		
		return attachMapper.getAttachList(productId);
	}
	

}
