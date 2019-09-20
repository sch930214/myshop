package shop.order;

import java.util.Hashtable;

public class CartMgr {
	private Hashtable hCart = new Hashtable();
	
	public void addCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		int quantity = Integer.parseInt(obean.getQuantity());
		
		if(quantity > 0) {
			
			if(hCart.containsKey(product_no)) { //동일 상품 주문시 주문 수량만 증가(같은 상품인데 두 줄로 나오면 이상하니까~)
				OrderBean temp = (OrderBean)hCart.get(product_no);
				quantity += Integer.parseInt(temp.getQuantity());
				temp.setQuantity(Integer.toString(quantity));
				hCart.put(product_no, temp);
			}else { //새상품 주문시
				hCart.put(product_no, obean);
			}
		}
	}
	
	public Hashtable getCartList() {
		return hCart;
	}
	
	public void updateCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.put(product_no, obean);
	}
	
	public void deleteCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.remove(product_no);
	}
	
}
