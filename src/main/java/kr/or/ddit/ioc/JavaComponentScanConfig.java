package kr.or.ddit.ioc;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration	//설정 파일인지를 미리 선언 < - xml대신
@ComponentScan(basePackages= {"kr.or.ddit.board"})
public class JavaComponentScanConfig {

}
