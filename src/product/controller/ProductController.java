package product.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.Page;

import product.dto.ProductDto;
import product.fileUtil.Domain;
import product.fileUtil.EntityProduct;
import product.fileUtil.EntityProductImage;
import product.fileUtil.ProductFileModel;
import product.service.ProductService;

@Controller
public class ProductController {
	private String contextPath = "";

	// 모든 변수 이름 지정은 클래스 이름명과 동일(첫 번째 글자를 소문자로 할 것)
	@Autowired
	private ProductService productService;

	// 상품 입력 Get
	@RequestMapping(value = "/prInsert", method = RequestMethod.GET)
	public String prInsertGet() {
		return "product/prInsertView";
	}

	// id 획득
	@RequestMapping(value = "/idNumCreater", method = RequestMethod.POST)
	public @ResponseBody String idNumCreater(@RequestParam String item) {
		String id = productService.getMaxIdNumber(item);
		if (item.equals("se")) {
			id = "";
		}
		return id;
	}

	// 상품 입력 Post
	@RequestMapping(value = "/prInsert", method = RequestMethod.POST)
	public String prInsertPost(@ModelAttribute Domain domain) {
		// 상품 삽입 영역!
		productService.saveFile(domain);
		return "redirect:/main.jsp";
	}

	@RequestMapping(value = "/prDetail", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
	public String prDetailGet(@ModelAttribute EntityProduct bean, Model model) {
		model.addAttribute("bean", bean);
		System.out.println("before"+bean);
		
		//EntityProductImage img = productService.getImgById(bean.getProductId());

		/*if (img != null) {// 이미지가 존재 한다면?
			img.setImgPath(img.getImgPath().replaceAll("\\\\", "/"));
			String imgPath = img.getImgPath() + img.getImgName();
			model.addAttribute("img", imgPath);
		}*/
		return "product/prDetailView";
	}

	@RequestMapping(value = "/prDetail", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public String prDetailPost(@ModelAttribute EntityProduct bean, int prbuyea, Model model) {
		System.out.println("after" + bean);
		model.addAttribute("bean", bean);
		System.out.println(prbuyea);
		String name = null;
		String cateId = null;
		try {
			name= URLEncoder.encode(bean.getProductName(), "UTF-8");
			cateId= URLEncoder.encode(bean.getCategoryId(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/order/orInsert"+"?productId="+bean.getProductId()+"&productName="+name+"&categoryId="+cateId+"&price="+
		bean.getPrice()+"&stock="+bean.getStock()+"&prosize="+bean.getProsize()+"&prodate="+bean.getProdate()+"&buyYn="+bean.getBuyYn()+"&explain="+
		bean.getExplain()+"&count="+bean.getCount()+"&prbuyea="+prbuyea;
	}
	
	// 상품 전체 리스트
	@RequestMapping(value = "/prList", method = RequestMethod.GET)
	public String prListGet(@RequestParam(defaultValue = "1") int selectPage,
			Model model) {
		// System.out.println("contextPath1"+((HttpServletRequest)
		// request).getRequestURI());
		EntityProductImage bean = productService.getImgById("to-00001");
		// System.out.println(bean.toString());
		int startpage=1;
		int endpage=(int)Math.ceil((double)productService.page()/Page.size);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("selectpage",selectPage);
		List<ProductFileModel> lists = productService.getList(selectPage);
		for(ProductFileModel fe:lists){
			System.out.println(fe.getProductId());
		}
		model.addAttribute("lists", lists);
		return "product/prListView";
	}

	// 장난감 리스트
	@RequestMapping(value = "/toyList", method = RequestMethod.GET)
	public String toyListGet(@RequestParam(defaultValue = "1") int selectPage,
			Model model) {
		// System.out.println("contextPath1"+((HttpServletRequest)
		// request).getRequestURI());
		EntityProductImage bean = productService.getImgById("to-00001");
		// System.out.println(bean.toString());
		
		int startpage=1;
		int endpage=(int)Math.ceil((double)productService.toypage()/Page.size);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("selectpage",selectPage);
		List<ProductFileModel> lists = productService.getToyList(selectPage);
		model.addAttribute("lists", lists);
		return "product/prToyListView";
	}

	// 디자인문구 리스트
	@RequestMapping(value = "/designList", method = RequestMethod.GET)
	public String DesignListGet(
			@RequestParam(defaultValue = "1") int selectPage, Model model) {
		// System.out.println("contextPath1"+((HttpServletRequest)
		// request).getRequestURI());
		EntityProductImage bean = productService.getImgById("to-00001");
		// System.out.println(bean.toString());
		int startpage=1;
		int endpage=(int)Math.ceil((double)productService.designpage()/Page.size);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("selectpage",selectPage);
		List<ProductFileModel> lists = productService.getDesignList(selectPage);
		model.addAttribute("lists", lists);
		return "product/prDesignListView";
	}

	// 홈 인테리어 리스트
	@RequestMapping(value = "/interiorList", method = RequestMethod.GET)
	public String InteriorListGet(
			@RequestParam(defaultValue = "1") int selectPage, Model model) {
		// System.out.println("contextPath1"+((HttpServletRequest)
		// request).getRequestURI());
		EntityProductImage bean = productService.getImgById("to-00001");
		// System.out.println(bean.toString());
		
		int startpage=1;
		int endpage=(int)Math.ceil((double)productService.interiorpage()/Page.size);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("selectpage",selectPage);
		List<ProductFileModel> lists = productService.getInteriorList(selectPage);
		model.addAttribute("lists", lists);
		return "product/prInteriorListView";
	}
}