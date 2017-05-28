package order.dto;

import java.util.List;

public class OrderModel {
	private int orderNumber;
	private String orderDate;
	private String email;
	private List<OrderItemDto> oiList;
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<OrderItemDto> getOiList() {
		return oiList;
	}
	public void setOiList(List<OrderItemDto> oiList) {
		this.oiList = oiList;
	}
	@Override
	public String toString() {
		return "OrderModel [orderNumber=" + orderNumber + ", orderDate=" + orderDate + ", email=" + email + ", oiList="
				+ oiList + "]";
	}
	
}
