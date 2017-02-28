package yong.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class TimeChecker {
	
	//특정 매개 변수를 갖느냐 갖지않느냐 로 Advice 클래스 구별 가능 -> proceedingjoinpoint를 매개값으로 가지고 있어야 advice 클래스로 된다
	 
	public Object yongTime(ProceedingJoinPoint joinpoint){
		
		//선처리
		System.out.println("[yongTime 기동됨!]");
		long start = System.currentTimeMillis();
		
		Object result = null;
		
		try {
			result = joinpoint.proceed(); //내 다음에 호출되어야하는 대상자 를 호출(핵심이 될수도 다른 관점이 될수도 있음
			//반환해주어야하는 결과가 무슨 타입인지 모르니까 object
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//후처리
		long end = System.currentTimeMillis();
		System.out.println("경과시간 : "+(end-start)+"ms");
		System.out.println("[yongTime 종료됨!]");
		
		return result;
		
	}
	

}
