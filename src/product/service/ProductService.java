package product.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dto.CustomerDto;
import com.mapper.Page;

import product.dto.ProductDto;
import product.dto.ProductItem;
import product.fileUtil.Domain;
import product.fileUtil.EntityProduct;
import product.fileUtil.EntityProductImage;
import product.fileUtil.FileUtil;
import product.fileUtil.ProductFileModel;
import product.repository.ProductRepository;


@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	
	
	public int saveFile(Domain domain){
		System.out.println("saveFile 도착!");
		// 변수 선언
		EntityProductImage entityProductImage = null;
		String[] savedFileName = new String[domain.getImgName().size()];
		FileUtil fileUtil = new FileUtil();
		int i = 0;
		int cnt = 0;
		
		//DAO 호출
		EntityProduct entityProduct = new EntityProduct();
		
		Calendar cal = Calendar.getInstance();
		String date = String.valueOf(cal.get(Calendar.YEAR))+"/"+String.valueOf(cal.get(Calendar.MONTH))+"/"+String.valueOf(cal.get(Calendar.DATE));
		String productId = domain.getProductId1()+"-"+domain.getProductId2();
		entityProduct.setProductId(productId);		
		entityProduct.setBuyYn(domain.getBuyYn());
		entityProduct.setCategoryId(domain.getCategoryId());
		entityProduct.setCount(domain.getCount());
		entityProduct.setExplain(domain.getExplain());
		entityProduct.setPrice(domain.getPrice());
		entityProduct.setProdate(date);
		entityProduct.setProductName(domain.getProductName());
		entityProduct.setProsize(domain.getProsize());
		entityProduct.setStock(domain.getStock());
		
		System.out.println(entityProduct);
		//prp : PRoduct Put
		productRepository.prpputProduct(entityProduct);
		
		//1. 파일 서버에 저장될 유일한 파일 이름 생성
		for(MultipartFile bean:domain.getImgName()){
			if(bean.getOriginalFilename().equals(null)||bean.getOriginalFilename().isEmpty()){
				
			}else{
				savedFileName[i] = fileUtil.makeSavedFileName(bean.getOriginalFilename());
				
				//2. 파일 서버에 파일 저장
				boolean FileUploadResult = false;
				try {
					FileUploadResult = fileUtil.saveFile(savedFileName[i], domain.getImgPath(), bean.getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("FileUploadResult : " + FileUploadResult);
				//3. db에 저장할 엔티티 생성
				
				if(FileUploadResult){
					entityProductImage = new EntityProductImage();
					
					String savedname = savedFileName[i];
					
					entityProductImage.setImgName(savedname);
					entityProductImage.setImgPath(domain.getImgPath());
					entityProductImage.setProductId(productId);
					
					}
				cnt = productRepository.prpputImage(entityProductImage);
				i++;
			}
		}
		
		return cnt;
	}

	public String getMaxIdNumber(String item) {
		DecimalFormat df = new DecimalFormat("00000");
		ProductItem productItem = new ProductItem();
		productItem.setItem(item);
		String id = productRepository.prpgetMaxIdNumber(productItem);
		try{
			if(id!=null){
				id = String.valueOf(df.format(Integer.parseInt(id.replaceAll("[^0-9]+", ""))));
			}else{
				id="1";
			}
		}catch(NullPointerException e){
			e.printStackTrace();
		}
		if(id.length()>=2){
			return String.valueOf(df.format(Integer.parseInt(id.substring(id.length()-5))+1));
		}else{
			return String.valueOf(df.format(Integer.parseInt(id)));
		}
		
	}

	public List<ProductFileModel> getList(int selectPage) {
		 RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		 
		return productRepository.getList(rowBounds);
	}

	public EntityProductImage getImgById(String string) {
		return productRepository.getImgById("to-00001");
	}

	public List<ProductFileModel> getToyList(int selectPage) {
		RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		return productRepository.getToyList(rowBounds);
	}

	public List<ProductFileModel> getDesignList(int selectPage) {
		RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		return productRepository.getDesignList(rowBounds);
	}

	public List<ProductFileModel> getInteriorList(int selectPage) {
		RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		return productRepository.getInteriorList(rowBounds);
	}

	

	public double page() {
		return productRepository.page();
	}

	public double toypage() {
		return productRepository.toypage();
	}

	public double designpage() {
		return productRepository.designpage();
	}

	public double interiorpage() {
		return productRepository.interiorpage();
	}

}
