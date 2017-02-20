package jin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	
	//인터페이스는 추상메서드만 가질 수 있음
	
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
	}
