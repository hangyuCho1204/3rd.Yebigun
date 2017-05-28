package product.repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.dto.ProductDto;
import product.dto.ProductItem;
import product.fileUtil.EntityProduct;
import product.fileUtil.EntityProductImage;
import product.fileUtil.ProductFileModel;
import product.mapper.ProductMapper;


@Repository
public class ProductRepository {
	
	@Autowired
	private ProductMapper mapper;
	
	//��ǰ ����
	public int prpputProduct(EntityProduct entityProduct){
		System.out.println("�������丮 ����!");
		//prp : PRoduct Put
		return mapper.putProduct(entityProduct);
	}
	
	public int prpputImage(EntityProductImage entityFiles){
		return mapper.saveFile(entityFiles);
	}
	//Ʈ������� ����ϱ� ���� �տ� put�� �ٿ���.
	public String prpgetMaxIdNumber(ProductItem productItem) {
		return mapper.getMaxIdNumber(productItem);
	}

	public List<ProductFileModel> getList(RowBounds rowBounds) {
		return mapper.getList(rowBounds);
	}

	public EntityProductImage getImgById(String string) {
		return mapper.getImgById("to-00001");
	}

	public List<ProductFileModel> getToyList(RowBounds rowBounds) {
		return mapper.getToyList(rowBounds);
	}

	public List<ProductFileModel> getDesignList(RowBounds rowBounds) {
		return mapper.getDesignList(rowBounds);
	}

	public List<ProductFileModel> getInteriorList(RowBounds rowBounds) {
		return mapper.getInteriorList(rowBounds);
	}

	public double page() {
		return mapper.page();
	}

	public double toypage() {
		return mapper.toypage();
	}

	public double designpage() {
		return mapper.designpage();
	}

	public double interiorpage() {
		return mapper.interiorpage();
	}
}