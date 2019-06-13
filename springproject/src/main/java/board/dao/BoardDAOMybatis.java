package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Transactional
@Repository
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("boardSQL.getTotalA");
	}

	@Override
	public BoardDTO boardView(String seq) {
		return sqlSession.selectOne("boardSQL.boardView", seq);
	}

	@Override
	public List<BoardDTO> boardSearch(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.boardSearch", map);
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getTotalSearchA", map);
	}

	@Override
	public void boardModify(Map<String, String> map) {
		sqlSession.update("boardSQL.boardModify", map);
	}

	@Override
	public void boardDelete(String seq) {
		sqlSession.delete("boardSQL.boardDelete", Integer.parseInt(seq));
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.update("boardSQL.boardReply", map);
	}
}















