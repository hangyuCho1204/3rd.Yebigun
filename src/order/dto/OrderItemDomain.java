package order.dto;

public class OrderItemDomain {
	private String productId;
	private int orderStock;
	private String request;
	private int orderPrice;
	private int deliveryPrice;
	private int procState;
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
	@Override
	public String toString() {
		return "OrderDto [productId=" + productId + ", orderStock=" + orderStock
				+ ", request=" + request + ", orderPrice=" + orderPrice + ", deliveryPrice=" + deliveryPrice
				+ ", procState=" + procState + "]";
	}
}
