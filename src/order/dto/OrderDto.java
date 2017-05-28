package order.dto;

public class OrderDto {
	private int orderNumber;
	private String orderDate;
	private String email;
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
	@Override
	public String toString() {
		return "OrderDto [orderNumber=" + orderNumber + ", orderDate=" + orderDate + ", email=" + email + "]";
	}
}
