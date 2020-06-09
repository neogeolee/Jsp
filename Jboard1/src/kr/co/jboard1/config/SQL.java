package kr.co.jboard1.config;

public class SQL {

	// 회원 관련
	public final static String INSERT_REG  = "INSERT INTO `JBOARD_MEMBER` SET "
											+ "`uid`= ?, "
											+ "`pass`=PASSWORD(?), "
											+ "`name`=?, "
											+ "`nick`=?, "
											+ "`email`=?, "
											+ "`hp`=?, "	   
											+ "`zip`=?, "
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
	
	public final static String INSERT_LOGIN = "SELECT * FROM `JBOARD_MEMBER` " 
											+"WHERE `uid`=? AND `pass`=PASSWORD(?)";	
	
	// 게시물 관련
	public final static String DELETE_ARTICLE = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=? ";
	
	public final static String UPDATE_HIT = "UPDATE `JBOARD_ARTICLE` SET `hit` = `hit` + 1 WHERE `seq`=?";
	
	public final static String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE`"
												+ "WHERE `seq`=?";
	
	public final static String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid";
			
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
		   
	
	
}
