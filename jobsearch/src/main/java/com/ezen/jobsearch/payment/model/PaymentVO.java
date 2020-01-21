package com.ezen.jobsearch.payment.model;

public class PaymentVO {
	 private int paymentSeq;
	 private String paymentCode;
	 private String productName;
	 private String priceDate;
	 private String payType;
	 private String cardAuthNum;
	 private int refAnnounctment;
	 
	public int getPaymentSeq() {
		return paymentSeq;
	}
	public void setPaymentSeq(int paymentSeq) {
		this.paymentSeq = paymentSeq;
	}
	public String getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPriceDate() {
		return priceDate;
	}
	public void setPriceDate(String priceDate) {
		this.priceDate = priceDate;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getCardAuthNum() {
		return cardAuthNum;
	}
	public void setCardAuthNum(String cardAuthNum) {
		this.cardAuthNum = cardAuthNum;
	}
	public int getRefAnnounctment() {
		return refAnnounctment;
	}
	public void setRefAnnounctment(int refAnnounctment) {
		this.refAnnounctment = refAnnounctment;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [paymentSeq=" + paymentSeq + ", paymentCode=" + paymentCode + ", productName=" + productName
				+ ", priceDate=" + priceDate + ", payType=" + payType + ", cardAuthNum=" + cardAuthNum
				+ ", refAnnounctment=" + refAnnounctment + "]";
	}
	 
	 
}
