package product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.session.RowBounds;

import product.dto.ProductDto;
import product.dto.ProductItem;
import product.fileUtil.EntityProduct;
import product.fileUtil.EntityProductImage;
import product.fileUtil.ProductFileModel;

public interface ProductMapper {
	//��ǰ ����
	@Insert("insert into product values('${productId}', '${productName}', '${categoryId}', '${price}', '${stock}', '${prosize}', '${prodate}', '${buyYn}', '${explain}', '${count}')")
	public int putProduct(EntityProduct entityProduct);
	
	//�̹��� ����
	@Insert("insert into product_image values('${imgId}','${productId}', '${imgPath}','${imgName}')")
	@SelectKey(statement="select img_id.nextval from dual", keyProperty="imgId", before=true, resultType=int.class)
	public int saveFile(EntityProductImage entityProductImage);
	
	@Select("select max(product_id) as id from product where product_id like '${item}'||'%'")
	public String getMaxIdNumber(ProductItem productItem);

	/*@Select("select * from product order by product_id")*/
	public List<ProductFileModel> getList(RowBounds rowBounds);
	
	public EntityProductImage getImgById(String productId);
	
    //@Select("select *from product where category_id like '%'||'����'||'%' order by category_id")
	public List<ProductFileModel> getToyList(RowBounds rowBounds);
    
    //@Select("select *from product where category_id like '%'||'�����ι���'||'%' order by category_id")
	public List<ProductFileModel> getDesignList(RowBounds rowBounds);

   // @Select("select *from product where category_id like '%'||'Ȩ���׸���'||'%' order by category_id")
	public List<ProductFileModel> getInteriorList(RowBounds rowBounds);

    @Select("select count(*) from product")
	public double page();

    @Select("select count(*) from product where category_id like '%'||'����'||'%'")
	public double toypage();

    @Select("select count(*) from product where category_id like '%'||'�����ι���'||'%'")
	public double designpage();

    @Select("select count(*) from product where category_id like '%'||'Ȩ���׸���'||'%'")
	public double interiorpage();
	
	/*@Select("select * from product_image where id = #{id}")
	public EntityProductImage getEntityFiles(int id);
	
	public ProductFileModel join(String id);
	
	@Select("select * from product")
	public List<EntityProduct> findAllBoardList();
	//��� ������ �ֱ� ���� ���� ���ε� �� ���� ������ DB�� �� �ִ� ������ ��ġ���Ѿ� ��.
	
	@Select("select * from product where product_id = #{product_id}")
	public EntityProduct findById(int id);

	@Insert("insert into product_category values( #{categoryId}, #{explain})")
	public int putCategory();*/
	
	//@Select("select * from customer where email = #{email}")
	//public CustomerDto getLoginBean(String email);
}
