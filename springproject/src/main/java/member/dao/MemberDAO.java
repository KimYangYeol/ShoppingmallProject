package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import member.bean.PostDTO;

public interface MemberDAO {

	public MemberDTO login(String id, String pwd);

	public MemberDTO checkId(String id);

	public List<PostDTO> postSearch(Map<String, String> map);

	public int write(MemberDTO memberDTO);

}
