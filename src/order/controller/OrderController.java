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
		System.out.println("����");
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
	
	// �ֹ� �Է� post
	@RequestMapping(value = "/orInsert", method = RequestMethod.POST)
	public String orInsertPost(@ModelAttribute EntityProduct product, int prbuyea, String email, String request, int item, int dc, HttpSession session, Model model) {
		//order dto ���� �� parameter ���� ����
		OrderDto order = new OrderDto();
		//order.setOrderDate(orderDate); system�� ����
		order.setEmail(email);
		//order.setOrderDate(orderDate);�ý��� ��¥ ����
		//order.setOrderNumber(orderNumber);������ ����
		
		//order ����
		int cnt1 = orderService.putOrder(order);
		System.out.println(cnt1);
		
		//order_item dto ���� �� �� ���� ����
		OrderItemDto oiDto = new OrderItemDto();
		oiDto.setProductId(product.getProductId());
		oiDto.setOrderStock(prbuyea);
		oiDto.setRequest(request);
		oiDto.setOrderPrice(item*prbuyea);
		oiDto.setDeliveryPrice(dc);
		int orderNumber = orderService.getOrderNum(email);
		System.out.println(orderNumber);
		oiDto.setOrderNumber(orderNumber);
		int procState = 0;//DB�� ��ǰ�� �Ǹŵ� ���� ������ ���ٸ� 0
		if(orderService.getSellQty(product.getProductId())!=null){
			procState = Integer.parseInt(orderService.getSellQty(product.getProductId()));
		}
		oiDto.setProcState(procState+prbuyea);//�Ǹŵ� ���� + �̹��� �ȸ��� ����
		//order_item dto �� ���� ����
		
		//order_item Dto DB�� ����
		int cnt = orderService.putOi(oiDto);
		System.out.println("orderitem ���� ���� ����(1) : "+cnt);
		CustomerDto member = (CustomerDto)session.getAttribute("loginfo");
		model.addAttribute("order", order);
		model.addAttribute("oiDto", oiDto);
		model.addAttribute("member", member);
		return "order/orderDoneView";
	}

	//�ֹ� �Ϸ�
		@RequestMapping(value = "/orDone", method = RequestMethod.GET)
		public String orDonePost(@ModelAttribute EntityProduct product){
			System.out.println(product);
			System.out.println("done");
			return "orderDoneView";
		}
	
	//�ֹ� ����Ʈ
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
		System.out.println("����Ʈ ����");
		List<OrderDto> lists = orderService.getOrList(order,selectPage);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "order/orderListView";
	}
	
	@RequestMapping(value = "/orDetail", method = RequestMethod.GET)
	public String orDetailGet(@RequestParam  int id,HttpSession session, Model model) {
		
		System.out.println("������ ����");
		System.out.println(id);
		OrderModel bean = orderService.getOrderModel(id);
		System.out.println(bean);
		model.addAttribute("bean", bean);
		return "order/orderDetailView";
	}
}
