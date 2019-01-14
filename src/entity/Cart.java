package entity;

import java.util.ArrayList;
import java.util.List;

import business.entity.BoutiqueItem;

public class Cart {

	private List<CartItem> itemList = new ArrayList<>();

	public Cart() {

	}

	public Cart(List<CartItem> itemList) {
		super();
		this.itemList = itemList;
	}

	public List<CartItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<CartItem> itemList) {
		this.itemList = itemList;
	}

	public void add(BoutiqueItem bi) { 
		CartItem cartitem = new CartItem(bi.getCode(), bi.getLabel(), 1, bi.getPrice()); //creation d'un item du panier, nouvel item!!
		for (CartItem ci : itemList) { // parcour de la liste de items du panier = ce sont des items, mais créés précédemment, qui ont été déjà rajoutés
			if(cartitem.getCode().equals(ci.getCode())) {
			int quantity = ci.getQuantity();
			ci.setQuantity(quantity + 1); //s'il existe, on augmente juste la quantité
			return; // et on sort
			}
		}
		itemList.add(cartitem);
	}
	
	public void delete(int index) {
		itemList.remove(index);
	}
	
	public void update (List<Integer>list) {
		int index = 0;
		for (CartItem ci : itemList) {
			ci.setQuantity(list.get(index));
			index++;
		} 
		
	}
	
}
