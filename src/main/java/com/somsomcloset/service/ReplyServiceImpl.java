package com.somsomcloset.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsomcloset.mapper.ReplyMapper;
import com.somsomcloset.model.Criteria;
import com.somsomcloset.model.PageDTO;
import com.somsomcloset.model.ReplyDTO;
import com.somsomcloset.model.ReplyPageDTO;
import com.somsomcloset.model.UpdateReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	/* 댓글등록*/ 
	@Override
	public int enrollReply(ReplyDTO dto) {
		
		int result = replyMapper.enrollReply(dto);
		
		return result;
	}
	
	
	/* 댓글 존재 체크 */
	@Override
	public String checkReply(ReplyDTO dto) {
		
		Integer result = replyMapper.checkReply(dto);
		
		if(result == null) {
			return "0";
		} else {
			return "1";
		}
		
	}	
	
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, replyMapper.getReplyTotal(cri.getProductId())));
		
		return dto;
	}	
	
	@Override
	public int updateReply(ReplyDTO dto) {
		
		int result = replyMapper.updateReply(dto); 
		
		return result;
	}	
	
	@Override
	public ReplyDTO getUpdateReply(int replyId) {
		
		return replyMapper.getUpdateReply(replyId);
	}	
	
	@Override
	public int deleteReply(ReplyDTO dto) {
		
		int result = replyMapper.deleteReply(dto.getReplyId()); 
		
		return result;
	}		
	
	public void setRating(int productId) {
		
		Double ratingAvg = replyMapper.getRatingAverage(productId);	
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}	
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setProductId(productId);
		urd.setRatingAvg(ratingAvg);	
		
		replyMapper.updateRating(urd);		
		
	}
	
}
