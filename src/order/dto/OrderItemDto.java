package order.dto;

public class OrderItemDto {
	private int orderItemId;
	private String productId;
	private int orderStock;
	private String request;
	private int orderPrice;
	private int deliveryPrice;
	private int procState;
	private int orderNumber;
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getOrderStock() {
		return orderStock;
	}
	public void setOrderStock(int orderStock) {
		this.orderStock = orderStock;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getProcState() {
		return procState;
	}
	public void setProcState(int procState) {
		this.procState = procState;
	}
	
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderId) {
		this.orderNumber = orderId;
	}
	@Override
	public String toString() {
		return "OrderItemDto [orderItemId=" + orderItemId + ", productId=" + productId + ", orderStock=" + orderStock
				+ ", request=" + request + ", orderPrice=" + orderPrice + ", deliveryPrice=" + deliveryPrice
				+ ", procState=" + procState + ", orderId=" + orderNumber + "]";
	}
}
