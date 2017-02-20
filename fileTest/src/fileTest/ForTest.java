package fileTest;

public class ForTest {

	public static void main(String[] args) {
		String fruit[] = {"딸기", "오렌지", "복숭아", "메론", "귤"};
		
		for(int i=0;i<fruit.length;i++){
			System.out.println(fruit[i]);
		}

		System.out.println("------------------");
		
		for(String temp:fruit){
			System.out.println(temp);
		}
		//확장for문 : 모든 요소에 접근하여 이 모든 요소를 출력하는 목적일 때만 사용 가능
	}

}
