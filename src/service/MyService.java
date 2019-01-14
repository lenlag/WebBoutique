package service;

import java.util.ArrayList;
import java.util.List;

import business.entity.BoutiqueItem;
import persistence.dao.BoutiqueDao;

public class MyService {

	
	public MyService () {
		
	}
	
	private List<BoutiqueItem> biList = new ArrayList<>();
	private BoutiqueDao dao = new BoutiqueDao();
	
	
	public List<BoutiqueItem> findAll () throws Exception {
		biList = dao.findAll();
		return biList;
		
	}
	
	public BoutiqueItem findById(long id) throws Exception {
		BoutiqueItem bi = dao.findById(id);
		return bi;
		
	}
}
