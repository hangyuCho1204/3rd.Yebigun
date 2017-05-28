package product.fileUtil;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Domain {
	
	private String productId1;
	private String productId2;
	private String productName;
	private String categoryId;
	private int price;
	private int stock;
	private String prosize;
	private String prodate;
	private String buyYn;
	private String explain;
	private int count;
	private String imgPath;
	private List<MultipartFile> imgName;
	public String getProductId1() {
		return productId1;
	}
	public void setProductId1(String productId1) {
		this.productId1 = productId1;
	}
	public String getProductId2() {
		return productId2;
	}
	public void setProductId2(int productId2) {
		DecimalFormat df = new DecimalFormat("00000");
		this.productId2 = df.format(productId2);;
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
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public List<MultipartFile> getImgName() {
		return imgName;
	}
	public void setImgName(List<MultipartFile> imgName) {
		this.imgName = imgName;
	}
	@Override
	public String toString() {
		return "Domain [productId1=" + productId1 + ", productId2=" + productId2 + ", productName=" + productName
				+ ", categoryId=" + categoryId + ", price=" + price + ", stock=" + stock + ", prosize=" + prosize
				+ ", prodate=" + prodate + ", buyYn=" + buyYn + ", explain=" + explain + ", count=" + count
				+ ", imgPath=" + imgPath + ", imgName=" + imgName + "]";
	}
}

