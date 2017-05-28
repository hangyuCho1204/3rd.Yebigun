package order.repository;

import order.dto.OrderDto;
import order.dto.OrderItemDomain;
import order.dto.OrderItemDto;
import order.dto.OrderModel;
import order.mapper.OrderMapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CustomerDto;


@Repository
public class OrderRepository {
	
	@Autowired
	private OrderMapper mapper;

	public String getSellQty(String productId) {
		return mapper.getSellQty(productId);
	}

	public int putOi(OrderItemDto oiDomain) {
		return mapper.putOi(oiDomain);
	}

	public int putOrder(OrderDto order) {
		return mapper.putOrder(order);
	}

	public int getOrderNum(String email) {
		return mapper.getOrderNum(email);
	}

	/*public OrderModel getOrderModel(String email) {
		return mapper.getOrderModel(email);
	}*/

	public List<OrderDto> getOrList(OrderDto order, RowBounds rowBounds) {
		return mapper.getOrList(order,rowBounds);
	}

	public OrderModel getOrderModel(int id) {
		return mapper.getOrderModel(id);
	}

	public double page() {
		return mapper.page();
	}

	
}