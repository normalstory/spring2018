package kr.or.ddit.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

//NotFileException의 경우 http응답모드를 서부 내부 에러인 500이 아닌, 404 not found 응답코드로 대체한다 
@ResponseStatus(HttpStatus.NOT_FOUND) 
public class NotFileException extends Exception{

}
