package order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.session.RowBounds;

import com.dto.CustomerDto;

import order.dto.OrderDto;
import order.dto.OrderItemDto;
import order.dto.OrderModel;

public interface OrderMapper {
	//order_item의 procState(팔린 수량)의 내용을 가지고 옴
	@Select("select max(proc_state) from product_order_item where product_id = #{productId}")
	String getSellQty(String productId);

	//order_item 항목 삽입
	@Insert("insert into product_order_item values(#{orderItemId},'${productId}', ${orderStock}, '${request}',${orderPrice},${deliveryPrice},${procState}, ${orderNumber})")
	@SelectKey(statement="select order_item_id.nextval from dual", keyProperty="orderItemId", before=true, resultType=int.class)
	int putOi(OrderItemDto oiDomain);
	
	@Insert("insert into product_order values(#{orderNumber}, to_date(sysdate,'yyyy/mm/dd'), '${email}')")
	@SelectKey(statement="select order_number.nextval from dual", keyProperty="orderNumber", before=true, resultType=int.class)
	int putOrder(OrderDto order);

	@Select("select max(order_number) as num from product_order where email = #{email}")
	int getOrderNum(String email);
	
	List<OrderDto> getList();
	
	int getOiByOrderNum(int order_number);

	//OrderModel getOrderModel(String email);
	
	//@Select("select * from product_order where email= #{email}")
	List<OrderDto> getOrList(OrderDto order, RowBounds rowBounds);

	OrderModel getOrderModel(int id);

	@Select("select count(*) from product_order")
	double page();
}