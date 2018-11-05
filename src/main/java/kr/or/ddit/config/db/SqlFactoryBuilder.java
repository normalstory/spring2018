package kr.or.ddit.config.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlFactoryBuilder {
	
	static SqlSessionFactory sqlSessionFactory ;
	
	static{
		String resource = "kr/or/ddit/config/db/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream= Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//SqlSessionFactory을 얻을 수 잇도록
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
