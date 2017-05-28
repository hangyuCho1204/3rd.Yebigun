package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CustomerDto;
import com.dto.CustomerLoginDto;
import com.dto.RefundDto;
import com.mapper.Page;
import com.secretcode.Encryption;
import com.service.CustomerService;

@Controller
public class CustomerController {

	// 모든 변수 이름 지정은 클래스 이름명과 동일(첫 번째 글자를 소문자로 할 것)
	@Autowired
	private CustomerService customerService;

	// 로그인 폼 Get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		System.out.println("도착");
		return "common/loginView";
	}

	// 로그인 폼 Post
	@RequestMapping(value="/login", produces="text/plain;charset=UTF-8", method=RequestMethod.POST)
	public @ResponseBody String loginPost(@ModelAttribute CustomerDto login, HttpSession session){
		String comment ="";
		
		Encryption encryption = new Encryption();
		encryption.encryption(login.getPasswd());
		System.out.println("암호:"+encryption.getPassword());
		login.setPasswd(encryption.getPassword());
		CustomerDto bean = customerService.getloginDto(login.getEmail());
		boolean loginfo = customerService.getloginDto(login);
		if(loginfo){
			if(login.getEmail().equals("hikari@naver.com")){
				session.setAttribute("loginfo", bean);
				comment="관리자님 어서오세요!";
			}else{
				session.setAttribute("loginfo", bean);
				comment="로그인 성공";
			}
			
		}else{
			comment="로그인 실패";
		}
		return comment;
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/main.jsp";
	}

	// 회원가입 폼 Get
	@RequestMapping(value = "/cuInsert", method = RequestMethod.GET)
	public String cuInsertGet() {
		return "customer/customerInsertView";
	}

	// 회원가입 폼 Post
	@RequestMapping(value = "/cuInsert", method = RequestMethod.POST)
	public String cuInsertPost(@ModelAttribute CustomerDto customer) {

		System.out.println("customer : " + customer);
		String[] phoneArr = customer.getPhone().split("-");
		String phone = null;
		for (int i = 0; i < phoneArr.length; i++) {
			if (phone == null) {
				phone = phoneArr[i];
			} else {
				phone += phoneArr[i];
			}
		}
		customer.setPhone(phone);
		String address1 = customer.getAddress1().replace(",", "");
		customer.setAddress1(address1);
		Encryption encryption = new Encryption();
		encryption.encryption(customer.getPasswd());
		customer.setPasswd(encryption.getPassword());

		customerService.putCustomer(customer);

		return "customer/close";
	}
	//관리자 회원 수정get
	@RequestMapping(value = "/cumodify", method = RequestMethod.GET)
	public String cuModifyGet(@RequestParam String email,Model model) {
		System.out.println(email);
		CustomerDto cumodify = new CustomerDto();
		cumodify.setEmail(email);
		cumodify=customerService.SelectDataByPk(cumodify);
		model.addAttribute("cumodify",cumodify);
		return "customer/customerModifyView";
	}
	//관리자 회원 수정post
	@RequestMapping(value = "/cumodify", method = RequestMethod.POST)
	public String cuModifyPost(@ModelAttribute CustomerDto customer) {

		System.out.println("customer : " + customer.toString());
		String[] phoneArr = customer.getPhone().split("-");
		String phone = null;
		for (int i = 0; i < phoneArr.length; i++) {
			if (phone == null) {
				phone = phoneArr[i];
			} else {
				phone += phoneArr[i];
			}
		}
		customer.setPhone(phone);
		String address1 = customer.getAddress1().replace(",", "");
		customer.setAddress1(address1);
		
		customerService.modifyCustomer(customer);

		return "redirect:/main.jsp";
	}

	//회원 수정get
	@RequestMapping(value = "/cusmodify", method = RequestMethod.GET)
	public String cusModifyGet(HttpSession session,Model model) {
		CustomerDto cumodify = new CustomerDto();
		cumodify=(CustomerDto) session.getAttribute("loginfo");
		cumodify=customerService.SelectDataByPk(cumodify);
		model.addAttribute("cumodify",cumodify);
		return "customer/customerModifyView";
	}
	//회원 수정post
	@RequestMapping(value = "/cusmodify", method = RequestMethod.POST)
	public String cusModifyPost(@ModelAttribute CustomerDto customer) {

		System.out.println("customer : " + customer.toString());
		String[] phoneArr = customer.getPhone().split("-");
		String phone = null;
		for (int i = 0; i < phoneArr.length; i++) {
			if (phone == null) {
				phone = phoneArr[i];
			} else {
				phone += phoneArr[i];
			}
		}
		customer.setPhone(phone);
		String address1 = customer.getAddress1().replace(",", "");
		customer.setAddress1(address1);
		
		customerService.modifyCustomer(customer);
		return "redirect:/main.jsp";
	}
	// 아이디 중복검사 Post
	@RequestMapping(value = "/cuIdcheck", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody String cuIdcheckPost(@RequestParam String email,HttpServletResponse response) {
		System.out.println(email);
		boolean idcheck = customerService.getEmail(email);
		String comment = "";
		if (idcheck) {
			comment = email + " 을(를) 사용하실 수 있습니다.";
		} else {
			comment = email + " 은(는) 이미 존재 합니다.";
		}
		return comment;
	}

	// 회원 상세보기
	@RequestMapping(value = "/customerDetailView", method = RequestMethod.GET)
	public String cuDetailGet(HttpSession session, Model model) {
		if (session.getAttribute("loginfo") != null) {
			CustomerDto detailView = new CustomerDto();
			detailView=(CustomerDto) session.getAttribute("loginfo");
			detailView = customerService.customerDetail(detailView);
			System.out.println(detailView.toString());
			model.addAttribute("detailView", detailView);
			return "customer/customerDetailView";
		} else {
			return "redirect:/main.jsp";
		}
	}
	//관리자가 보는 회원상세
	@RequestMapping(value = "/cudetail", method = RequestMethod.GET)
	public String cusDetailGet(@RequestParam String email, Model model) {
		
			System.out.println(email);
			CustomerDto detailView = new CustomerDto();
			detailView.setEmail(email);
			detailView = customerService.customerDetail(detailView);
			System.out.println(detailView.toString());
			model.addAttribute("detailView", detailView);
			return "customer/customerDetailView";
	}
	//회원의 교환 반품 환불신청 상태 
	@RequestMapping(value = "/customerrefundList", method = RequestMethod.GET)
	public String customerRefundListGet(@RequestParam(defaultValue = "1") int selectPage,HttpSession session, Model model) {
		if (session.getAttribute("loginfo") != null) {
			String email = (String) session.getAttribute("loginfo");
			System.out.println(email);
			RefundDto customerRefund = new RefundDto();
			customerRefund.setEmail(email);
			
			int startpage = 1;
			int endpage = (int) Math.ceil((double) customerService.customerRefundpage(customerRefund)/ Page.size);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("selectpage", selectPage);
			List<RefundDto> refund = customerService.customerRefund(selectPage,customerRefund);
			model.addAttribute("refund", refund);
			return "customer/cusrefundList";
		} else {
			return "redirect:/main.jsp";
		}
	}

	// 화면 닫기
	@RequestMapping(value = "/close", method = RequestMethod.GET)
	public String closeDo() {
		System.out.println("customer/close");
		return "customer/close";
	}

	// 회원 리스트
	@RequestMapping(value = "/cusList", method = RequestMethod.GET)
	// value는 주소값
	@ModelAttribute("customer")
	public List<CustomerDto> list(@RequestParam(defaultValue = "1") int selectPage, Model model) {

		int startpage = 1;
		int endpage = (int) Math.ceil((double) customerService.page()/ Page.size);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("selectpage", selectPage);

		List<CustomerDto> customer = customerService.getCustomerByPage(selectPage);

		return customer;
	}

	// 교환 현황
	@RequestMapping(value = "/refundList", method = RequestMethod.GET)
	// value는 주소값
	@ModelAttribute("refundList")
	public List<RefundDto> refund(@RequestParam(defaultValue = "1") int selectPage, Model model) {

		int startpage = 1;
		int endpage = (int) Math.ceil((double) customerService.refundpage()
				/ Page.size);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("selectpage", selectPage);

		List<RefundDto> refundList = customerService.getRefundByPage(selectPage);

		return refundList;
	}

	// 회원 삭제
	@RequestMapping(value = "/cusdelete", method = RequestMethod.GET)
	// value는 주소값
	public ModelAndView deleteCustomer(@RequestParam String email, Model model) {
		CustomerDto customer = new CustomerDto();
		customer.setEmail(email);
		customerService.remove(customer);

		model.addAttribute("customer", customer);
		return new ModelAndView("redirect:cusList");
	}

	// 회원 탈퇴
	@RequestMapping(value = "/cusutomerdelete", method = RequestMethod.GET)
	// value는 주소값
	public String customerDelete(HttpSession session, Model model) {
		CustomerDto customer = new CustomerDto();
		customer =  (CustomerDto) session.getAttribute("loginfo");
		customerService.remove(customer);

		session.invalidate();
		return "redirect:/main.jsp";
	}

	// 교환 목록 삭제
	@RequestMapping(value = "/redelete", method = RequestMethod.GET)
	// value는 주소값
	public ModelAndView deleteRefundSeq(@RequestParam int refundSeq, Model model) {
		RefundDto refundDto = new RefundDto();
		refundDto.setRefundSeq(refundSeq);
		customerService.remove(refundDto);

		model.addAttribute("refundDto", refundDto);
		return new ModelAndView("redirect:refundList");
	}

	// 매장 안내
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String locationGet() {
		System.out.println("location도착");
		return "common/location";
	}

	/*
	 * @RequestMapping(value="/update",method=RequestMethod.GET)//value는 주소값
	 * public String update(@RequestParam String email,Model model){ CustomerDto
	 * customer = new CustomerDto(); customer.setEmail(email);
	 * customer=customerService.SelectDataByPk(customer);
	 * 
	 * 
	 * 
	 * model.addAttribute("customer",customer); return "update"; }
	 * 
	 * @RequestMapping(value="/update",method=RequestMethod.POST)//value는 주소값
	 * 
	 * @ModelAttribute("customer") public ModelAndView upp( CustomerDto
	 * customer){
	 * 
	 * int count; count=customerService.modifyCustomer(customer); if(count!=0){
	 * System.out.println("수정성공!!"); }else{ System.out.println("수정실패!!"); }
	 * 
	 * 
	 * 
	 * return new ModelAndView("redirect:list");
	 * 
	 * }
	 */

}
