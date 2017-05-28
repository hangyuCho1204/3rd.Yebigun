package product.fileUtil;

public class EntityProduct {
	private String productId;
	private String productName;
	private String categoryId;
	private int price;
	private int stock;
	private String prosize;
	private String prodate;
	private String buyYn;
	private String explain;
	private int count;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getProsize() {
		return prosize;
	}
	public void setProsize(String prosize) {
		this.prosize = prosize;
	}
	public String getProdate() {
		return prodate;
	}
	public void setProdate(String prodate) {
		this.prodate = prodate;
	}
	public String getBuyYn() {
		return buyYn;
	}
	public void setBuyYn(String buyYn) {
		this.buyYn = buyYn;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "EntityProduct [productId=" + productId + ", productName="
				+ productName + ", categoryId=" + categoryId + ", price="
				+ price + ", stock=" + stock + ", prosize=" + prosize
				+ ", prodate=" + prodate + ", buyYn=" + buyYn + ", explain="
				+ explain + ", count=" + count + "]";
	}
}
