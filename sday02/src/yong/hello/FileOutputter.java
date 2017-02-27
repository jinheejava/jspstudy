package yong.hello;

import java.io.*;

public class FileOutputter implements Outputter {
	
	private String filename;
	
	//setter Injection 방식	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public void output(String msg) throws Exception {
		
		FileWriter fw = new FileWriter(filename);
		fw.write(msg);
		fw.close();
	}

}
