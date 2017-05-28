package product.dto;

public class ProductItem {
	private String item;

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "ProductItem [item=" + item + "]";
	}
}
