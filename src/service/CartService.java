package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import business.entity.BoutiqueItem;
import entity.Cart;
import entity.CartItem;

public class CartService {
	
	public static final String KEY = "CART";

	public void add(HttpSession session, BoutiqueItem bi) {
		Cart cart = (Cart)session.getAttribute(KEY);
		if(cart == null) { // si le panier est vide
			cart = new Cart(); // on le crée
			session.setAttribute(KEY, cart);
		}
		cart.add(bi);
	}
	
	public void delete(HttpSession session, int index) {
		Cart cart = (Cart) session.getAttribute(KEY);
		cart.delete(index);
	}
	
	
	public List<CartItem> list(HttpSession session) {
		Cart cart = (Cart) session.getAttribute(KEY);
		if(cart == null) {
			cart = new Cart();
			session.setAttribute(KEY, cart);
		}
		return cart.getItemList();
		
	}
	
	
	public void update(HttpSession session, List<Integer> list) {
		Cart cart = (Cart)session.getAttribute(KEY);
		if(cart == null) { 
			cart = new Cart(); 
			session.setAttribute(KEY, cart);
		}
		cart.update(list);
		
	}
	
	public void clear(HttpSession session) {
		Cart cart = (Cart) session.getAttribute(KEY);
		session.removeAttribute(KEY);
	}
	
	public double total(HttpSession session) {
		List<CartItem> myList = list (session);
		double sum = 0;
		for (CartItem ci : myList) {
			sum += ci.getPrice() * ci.getQuantity();
		}
		return sum;
	}
	
}



