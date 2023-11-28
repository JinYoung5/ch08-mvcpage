package kr.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.board.vo.BoardVO;
import kr.util.DBUtil;

public class BoardDAO {
	//싱글톤 패턴
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {}
	
	//글 등록
	public void insertBoard(BoardVO board)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "INSERT INTO zboard (board_num,title,content,filename,ip,mem_num) VALUES (zboard_seq.nextval,?,?,?,?,?)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getFilename());
			pstmt.setString(4, board.getIp());
			pstmt.setInt(5, board.getMem_num());
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//전체 레코드수	/검색 레코드수
	public int getBoardCount(String keyfield,String keyword) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;

		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			if(keyword!=null && !"".equals(keyword)) {
				//검색 처리
				if(keyfield.equals("1")) sub_sql += "WHERE title LIKE ?";
				else if(keyfield.equals("2")) sub_sql += "WHERE id LIKE ?";
				else if(keyfield.equals("3")) sub_sql += "WHERE content LIKE ?";
			}
			//SQL문 작성
			sql = "SELECT COUNT(*) FROM zboard JOIN zmember USING(mem_num) " + sub_sql;
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//전체 글		/검색 글 목록
	//글 상세
	//조회수 증가
	//파일 삭제
	//글 수정
	//글 삭제
	
	//좋아요 등록
	//좋아요 개수
	//회원번호와 게시물 번호를 이용한 종하요 정보
	//좋아요 삭제
	//내가 선택한 좋아요 목록
	
	//댓글 등록
	//댓글 개수
	//댓글 목록
	//댓글 상세(댓글 수정,삭제시 작성자 회원번호 체크 용도로 사용)
	//댓글 수정
	//댓글 삭제
}
