package product.fileUtil;

public class EntityProductImage {
	private int imgId;
	private String imgPath;
	private String imgName;
	private String productId;
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "EntityProductImage [imgId=" + imgId + ", imgPath=" + imgPath
				+ ", imgName=" + imgName + ", productId=" + productId + "]";
	}
}
