package com.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dto.CustomerDto;
import com.dto.CustomerLoginDto;
import com.dto.RefundDto;
import com.mapper.Page;
import com.repository.CustomerRepository;

@Service
@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
public class CustomerService {

	@Autowired
	CustomerRepository customerRepository;
	
	public int putCustomer(CustomerDto customer) {	
		
		return customerRepository.putCustomer(customer);
	}

	public boolean getloginDto(CustomerDto login) {
		CustomerDto customer = customerRepository.getloginDto(login.getEmail());
		
		if(customer!=null){
		if(customer.getEmail().equals(login.getEmail()) && customer.getPasswd().equals(login.getPasswd())){
			return true;
		}else if(customer.getEmail().equals(null)||customer.getEmail().equals("")||customer.getEmail().equals(" ")){
			return false;
		}else{
			return false;
		}
		
		}
		return false;
	}

	public boolean getEmail(String email) {
		
		CustomerDto customer = customerRepository.getloginDto(email);
		
		if(customer!=null){	
			if(customer.getEmail().equals(email)){
				return false;
			}else{
				return true;
			}
		}
		return true;
	}

	public double page() {
		return customerRepository.page();
	}

	public List<CustomerDto> getCustomerByPage(int selectPage) {
        RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		
		List<CustomerDto> customer = customerRepository.selectAll(rowBounds);
		
		return customer;
	}

	public List<RefundDto> getRefundByPage(int selectPage) {
		RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
			
		List<RefundDto> refund = customerRepository.Refund(rowBounds);
		for(RefundDto refundDto:refund){
			switch(refundDto.getRequestType()){
			case "1":
				refundDto.setRequestType("교환");
				break;
			case "2":
				refundDto.setRequestType("반품");
				break;
			case "3":
				refundDto.setRequestType("환불");
				break;
			}
			switch(refundDto.getProc_state()){
		     case "1":
		    	refundDto.setProc_state("대기");
		    	break;
		     case "2":
		    	refundDto.setProc_state("진행중");
		    	break;
	         case "3":
		     	refundDto.setProc_state("완료");
			    break;
		    }
		}	
	    return refund;
	}

	public double refundpage() {
		return customerRepository.refundpage();
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void remove(CustomerDto customer) {
		customerRepository.delete(customer);
	}

	public CustomerDto SelectDataByPk(CustomerDto customer) {
		return customerRepository.SelectDataByPk(customer);
	}

	public void remove(RefundDto refundDto) {
		customerRepository.deleteRefund(refundDto);
	}

	public CustomerDto customerDetail(CustomerDto detailView) {
		return customerRepository.customerDetail(detailView);
	}

	public List<RefundDto> customerRefund(int selectPage, RefundDto customerRefund) {
		 RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		List<RefundDto> refund = customerRepository.customerRefund(rowBounds,customerRefund);
		for(RefundDto refundDto:refund){
			switch(refundDto.getRequestType()){
			case "1":
				refundDto.setRequestType("교환");
				break;
			case "2":
				refundDto.setRequestType("반품");
				break;
			case "3":
				refundDto.setRequestType("환불");
				break;
			}
			switch(refundDto.getProc_state()){
		     case "1":
		    	refundDto.setProc_state("대기");
		    	break;
		     case "2":
		    	refundDto.setProc_state("진행중");
		    	break;
	         case "3":
		     	refundDto.setProc_state("완료");
			    break;
		    }
		}
		return refund;
	}

	public double customerRefundpage(RefundDto customerRefund) {
		return customerRepository.customerRefundpage(customerRefund);
	}

	public void modifyCustomer(CustomerDto customer) {
		customerRepository.modifyCustomer(customer);
	}
	public CustomerDto getloginDto(String email) {
		return customerRepository.getloginDto(email);
	}

}
