package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import member.bean.PostDTO;

@Transactional
@Repository
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("memberSQL.login", map);
	}

	@Override
	public MemberDTO checkId(String id) {
		return sqlSession.selectOne("memberSQL.checkId", id);
	}

	@Override
	public List<PostDTO> postSearch(Map<String, String> map) {
		return sqlSession.selectList("memberSQL.postSearch", map);
	}

	@Override
	public int write(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.write", memberDTO);
	}
}













