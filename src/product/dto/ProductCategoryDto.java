package product.dto;

public class ProductCategoryDto {
	private String categoryId;
	private String explain;
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	@Override
	public String toString() {
		return "ProductCategoryDto [categoryId=" + categoryId + ", explain="
				+ explain + "]";
	}
}