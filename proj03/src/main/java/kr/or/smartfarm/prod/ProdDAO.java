package kr.or.smartfarm.prod;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class ProdDAO {
	@Autowired
	SqlSession sqlSession;

	public List<ProdDTO> selectAll(ProdSearchDTO searchDTO){
		
		
		List<ProdDTO> list = sqlSession.selectList("kr.or.smartfarm.prod.prodAll");
		
		return list;
		
	}
	
}
