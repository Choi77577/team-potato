package kr.or.smartfarm.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProdController {
	
	@Autowired
	ProdService prodService;
	
	@RequestMapping("/list")
	public String list (@ModelAttribute ProdSearchDTO searchDTO, Model model) {
		System.out.println("°ñ°ñ");
		List<ProdDTO> list= prodService.prodAllSelect(searchDTO);
		
		model.addAttribute("list", list);
		
		return "prod.tiles";
	}
	
}
