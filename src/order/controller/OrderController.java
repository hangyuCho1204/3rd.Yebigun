package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.CustomerDto;
import com.mapper.Page;

import order.dto.OrderDto;
import order.dto.OrderItemDomain;
import order.dto.OrderItemDto;
import order.dto.OrderModel;
import order.service.OrderService;
import product.fileUtil.EntityProduct;


@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public String loginGet(){
		System.out.println("도착");
		return "order/basket";
	}
	
	@RequestMapping(value = "/orInsert", method = RequestMethod.GET)
	public String orInsertGet(@ModelAttribute EntityProduct product, int prbuyea, HttpSession session, Model model) {
		
		if (session.getAttribute("loginfo") != null) {
			CustomerDto member = (CustomerDto) session.getAttribute("loginfo");
			String post = null;
			String address1 = null;
				if(member.getAddress1().substring(0, 5).replaceAll("[^0-9]", "")!=null){
					if(member.getAddress1().substring(0, 5).replaceAll("[^0-9]", "").length()==5){
						post = member.getAddress1().substring(0, 5);
						address1 = member.getAddress1().substring(6, member.getAddress1().length());
					}
						OrderItemDomain domain = new OrderItemDomain();
						domain.setProductId(product.getProductId());
						domain.setOrderPrice(product.getPrice());
						domain.setOrderStock(prbuyea);
						domain.setDeliveryPrice(4000);
						model.addAttribute("domain", domain);
						
						model.addAttribute("post", post);
						member.setAddress1(address1);
						model.addAttribute("member", member);
						model.addAttribute("product", product);
				}
				
		}
		return "order/orderSigninView";
	}
	
	// 주문 입력 post
	@RequestMapping(value = "/orInsert", method = RequestMethod.POST)
	public String orInsertPost(@ModelAttribute EntityProduct product, int prbuyea, String email, String request, int item, int dc, HttpSession session, Model model) {
		//order dto 생성 및 parameter 삽입 영역
		OrderDto order = new OrderDto();
		//order.setOrderDate(orderDate); system값 삽입
		order.setEmail(email);
		//order.setOrderDate(orderDate);시스템 날짜 삽입
		//order.setOrderNumber(orderNumber);시퀀스 삽입
		
		//order 삽입
		int cnt1 = orderService.putOrder(order);
		System.out.println(cnt1);
		
		//order_item dto 생성 및 값 삽입 영역
		OrderItemDto oiDto = new OrderItemDto();
		oiDto.setProductId(product.getProductId());
		oiDto.setOrderStock(prbuyea);
		oiDto.setRequest(request);
		oiDto.setOrderPrice(item*prbuyea);
		oiDto.setDeliveryPrice(dc);
		int orderNumber = orderService.getOrderNum(email);
		System.out.println(orderNumber);
		oiDto.setOrderNumber(orderNumber);
		int procState = 0;//DB에 상품의 판매된 수량 정보가 없다면 0
		if(orderService.getSellQty(product.getProductId())!=null){
			procState = Integer.parseInt(orderService.getSellQty(product.getProductId()));
		}
		oiDto.setProcState(procState+prbuyea);//판매된 수량 + 이번에 팔리는 수량
		//order_item dto 값 삽입 종료
		
		//order_item Dto DB에 삽입
		int cnt = orderService.putOi(oiDto);
		System.out.println("orderitem 삽입 여부 성공(1) : "+cnt);
		CustomerDto member = (CustomerDto)session.getAttribute("loginfo");
		model.addAttribute("order", order);
		model.addAttribute("oiDto", oiDto);
		model.addAttribute("member", member);
		return "order/orderDoneView";
	}

	//주문 완료
		@RequestMapping(value = "/orDone", method = RequestMethod.GET)
		public String orDonePost(@ModelAttribute EntityProduct product){
			System.out.println(product);
			System.out.println("done");
			return "orderDoneView";
		}
	
	//주문 리스트
	@RequestMapping(value = "/orList", method = RequestMethod.GET)
	public String orListGet(@RequestParam(defaultValue = "1") int selectPage,HttpSession session, Model model) {
		CustomerDto member = (CustomerDto)session.getAttribute("loginfo");
		int startpage = 1; 
		
		OrderDto order = new OrderDto();
		order.setEmail(member.getEmail());
		int endpage = (int) Math.ceil((double) orderService.orderpage()/ Page.size);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("selectpage", selectPage);
		System.out.println("리스트 접속");
		List<OrderDto> lists = orderService.getOrList(order,selectPage);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "order/orderListView";
	}
	
	@RequestMapping(value = "/orDetail", method = RequestMethod.GET)
	public String orDetailGet(@RequestParam  int id,HttpSession session, Model model) {
		
		System.out.println("디테일 접속");
		System.out.println(id);
		OrderModel bean = orderService.getOrderModel(id);
		System.out.println(bean);
		model.addAttribute("bean", bean);
		return "order/orderDetailView";
	}
}
