package com.somsomcloset.model;

public class CateVO {
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 카테고리 넘버 */
	private String cateCode;

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	@Override
	public String toString() {
		return "CateVO [cateName=" + cateName + ", cateCode=" + cateCode + "]";
	}
	


}
