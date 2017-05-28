package com.repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CustomerDto;
import com.dto.RefundDto;
import com.mapper.CustomerMapper;


@Repository
public class CustomerRepository {
	
	@Autowired
	private CustomerMapper mapper;

	public int putCustomer(CustomerDto customer) {
	   return mapper.savemember(customer);
	}

	public CustomerDto getloginDto(String email) {
		System.out.println("getLoginBean:"+email);
		return mapper.getLoginBean(email);
	}

	public double page() {
		return mapper.page();
	}

	public List<CustomerDto> selectAll(RowBounds rowBounds) {
		return mapper.findByPage(rowBounds);
	}

	public List<RefundDto> Refund(RowBounds rowBounds) {
		return mapper.findPage(rowBounds);
	}

	public double refundpage() {
		return mapper.refundpage();
	}

	public void delete(CustomerDto customer) {
	    mapper.delete(customer);
	}

	public CustomerDto SelectDataByPk(CustomerDto customer) {
		return mapper.selectDataByPk(customer);
	}

	public void deleteRefund(RefundDto refundDto) {
		mapper.deleterefund(refundDto);
	}

	public CustomerDto customerDetail(CustomerDto detailView) {
		return mapper.customerDetail(detailView);
	}

	public List<RefundDto> customerRefund(RowBounds rowBounds, RefundDto customerRefund) {
		return mapper.customerRefund(rowBounds,customerRefund);
	}

	public double customerRefundpage(RefundDto customerRefund) {
		return mapper.customerRefundpage(customerRefund);
	}

	public void modifyCustomer(CustomerDto customer) {
		mapper.modifyCustomer(customer);
	}
	
}