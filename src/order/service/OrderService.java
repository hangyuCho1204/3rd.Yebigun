package order.service;

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

import order.dto.OrderDto;
import order.dto.OrderItemDomain;
import order.dto.OrderItemDto;
import order.dto.OrderModel;
import order.repository.OrderRepository;
import product.dto.ProductItem;
import product.fileUtil.Domain;
import product.fileUtil.EntityProduct;
import product.fileUtil.EntityProductImage;
import product.fileUtil.FileUtil;
import product.fileUtil.ProductFileModel;
import product.repository.ProductRepository;


@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public String getSellQty(String productId) {
		return orderRepository.getSellQty(productId);
	}

	public int putOi(OrderItemDto oiDomain) {
		return orderRepository.putOi(oiDomain);
	}

	public int putOrder(OrderDto order) {
		return orderRepository.putOrder(order);
	}

	public int getOrderNum(String email) {
		return orderRepository.getOrderNum(email);
	}

	/*public OrderModel getOrderModel(String email) {
		return orderRepository.getOrderModel(email);
	}*/

	public List<OrderDto> getOrList(OrderDto order, int selectPage) {
		RowBounds rowBounds = new RowBounds((selectPage-1)*Page.size,Page.size);
		return orderRepository.getOrList(order,rowBounds);
	}

	public OrderModel getOrderModel(int id) {
		return orderRepository.getOrderModel(id);
	}

	public double orderpage() {
		return orderRepository.page();
	}
	
}
