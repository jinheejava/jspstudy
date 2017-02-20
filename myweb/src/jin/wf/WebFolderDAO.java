package jin.wf;

import java.io.*;
import java.util.Vector;

public class WebFolderDAO {
	
	// 실제 서비스를 제공해주는 것은 복사본이므로 사용자가 올리는 파일은 복사본 myweb에 있어야 함
	
	public static final String USERS_HOME="E:/한진희/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/wf/upload";
	
	private String user; //사용자의 계정 이름
	private String crpath; //사용자의 현재 위치
	private int totalsize, usedsize, freesize; //총 용량, 사용 용량, 남은 용량
	
	public WebFolderDAO(){
		totalsize = 1024*1024*10;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	public int getTotalsize() {
		return totalsize;
	}

	public void setTotalsize(int totalsize) {
		this.totalsize = totalsize;
	}

	public int getUsedsize() {
		return usedsize;
	}
	 
	public void setUsedsize(int usedsize) {
		this.usedsize = usedsize;
	}

	public int getFreesize() {
		return freesize;
	}

	public void setFreesize(int freesize) {
		this.freesize = freesize;
	}

	/** 사용자의 공간이 있는지 확인 */
	public void userFolderExists(){
		
		File f = new File(USERS_HOME+"/"+user);
		
		if(!f.exists()){
			f.mkdir();			
		}
		
		usedsize=0;		
		settingUsedSize(f);			
		
		freesize = totalsize-usedsize;
		
	}
	
	public void settingUsedSize(File f){
		
		File files[] = f.listFiles();

		if(files!=null){
			for(int i=0; i<files.length;i++){
				if(files[i].isFile()){
					usedsize += files[i].length();								
				} else{
					settingUsedSize(files[i]);					
				}
			}
		}
	}
	
	
}
