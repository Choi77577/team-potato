package kr.or.smartfarm.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProdService {
	
	@Autowired
	ProdDAO prodDAO;
	
	public List<ProdDTO> prodAllSelect(ProdSearchDTO searchDTO){
		List<ProdDTO> list = prodDAO.selectAll(searchDTO);
		
		return list;
	}
	  
	
}
