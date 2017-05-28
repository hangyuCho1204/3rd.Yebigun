package com.dto;

public class RefundDto {
	private int refundSeq;
	private String requestType;
	private String product_id;
	private int order_number;
	private int stock;
	private String receiptdate;
	private String note;
	private String proc_state;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRefundSeq() {
		return refundSeq;
	}
	public void setRefundSeq(int refundSeq) {
		this.refundSeq = refundSeq;
	}
	public String getRequestType() {
		return requestType;
	}
	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getReceiptdate() {
		return receiptdate;
	}
	public void setReceiptdate(String receiptdate) {
		this.receiptdate = receiptdate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getProc_state() {
		return proc_state;
	}
	public void setProc_state(String proc_state) {
		this.proc_state = proc_state;
	}
	@Override
	public String toString() {
		return "RefundDto [refundSeq=" + refundSeq + ", requestType="
				+ requestType + ", product_id=" + product_id
				+ ", order_number=" + order_number + ", stock=" + stock
				+ ", receiptdate=" + receiptdate + ", note=" + note
				+ ", proc_state=" + proc_state + ", email=" + email + "]";
	}
	
	
}
