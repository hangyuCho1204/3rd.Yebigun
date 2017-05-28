package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.dto.CustomerDto;
import com.dto.RefundDto;

public interface CustomerMapper {
	//@Insert("insert into files values(#{id}, #{savedFileName}, #{originalFileName}, #{fileBoardId})")
	@Insert("insert into customer values('${email}', '${passwd}', '${name}', '${phone}', '${address1}', '${address2}', '${mpoint}')")
	public  int savemember(CustomerDto customer);

	@Select("select * from customer where email = #{email}")
	public CustomerDto getLoginBean(String email);

	@Select("select count(*) from customer")
	public int page();
	   
	@Select("select * from customer order by email")
	public List<CustomerDto> findByPage(RowBounds rowBounds);

	@Select("select * from product_refund order by refundSeq")
	public List<RefundDto> findPage(RowBounds rowBounds);

	@Select("select count(*) from product_refund")
	public double refundpage();

	@Delete("delete from  customer where email='${email}'")
	public void delete(CustomerDto customer);

	@Select("select * from customer where email = #{email}")
	public CustomerDto selectDataByPk(CustomerDto customer);

	@Delete("delete from  product_refund where refundSeq='${refundSeq}'")
	public void deleterefund(RefundDto refundDto);

	@Select("select * from customer where email = #{email}")
	public CustomerDto customerDetail(CustomerDto detailView);

	@Select("select *from product_refund where email=#{email} order by email")
	public List<RefundDto> customerRefund(RowBounds rowBounds, RefundDto customerRefund);

	@Select("select count(*) from product_refund where email=#{email}")
	public double customerRefundpage(RefundDto customerRefund);

	@Select("update customer set phone='${phone}',address1='${address1}',address2='${address2}' where email='${email}'")
	public void modifyCustomer(CustomerDto customer);
}
