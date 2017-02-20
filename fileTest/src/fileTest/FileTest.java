package fileTest;

import java.io.*;

public class FileTest {

	public static void main(String[] args) {
		File f1 = new File("e:/한진희/lib/ojdbc14.jar");
		
		//exists() 가리키는 파일이 존재하는지 구별
		System.out.println("f1 너 존재하니? "+f1.exists());
		
		//isFile, isDirectory 파일인지 폴더인지 판단 디렉티브=폴더
		System.out.println("f1 너 파일이니? "+f1.isFile());
		System.out.println("f1 너 디렉토리니? "+f1.isDirectory());
		
		System.out.println("f1의 이름? "+f1.getName());
		System.out.println("f1의 경로? "+f1.getPath());
		
		System.out.println("f1의 크기? "+f1.length()+"byte"); //byte단위로 출력해줌
		System.out.println();
		
		File f2 = new File("e:/한진희");
		
		System.out.println("F2 있니? "+f2.exists());
		System.out.println("f2 폴더니? "+f2.isDirectory());
		
		System.out.println("f2 파일이야? "+f2.isFile());
		
		System.out.println("f2의 이름? " +f2.getName());
		//폴더는 바구니 역할
		
		File files[] = f2.listFiles();
		
		for(int i=0;i<files.length;i++){
			
			String type=files[i].isFile()?"[File]\t":"[DIR]\t";
			long len = files[i].length();
			String len2 = files[i].isFile()?"("+len+"byte)":"";
			
			System.out.println(type+files[i].getName()+len2);
		}

	}

}
