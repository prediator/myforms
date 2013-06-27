package com.myforms.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


import org.apache.commons.lang.StringUtils;
//TODO make it singlton
/**
 * 
 * @author mohd.irshad
 *
 */
public class MessageReaderImpl implements MessageReader {
	public static String FILE_STORE = "filestore";
	@Override
	public String read(String key) throws IOException {
		String file = String.valueOf(PropertyEditor.getInstance().getProperty(key));
		if(!StringUtils.isEmpty(file)){
			String fileStore = String.valueOf(PropertyEditor.getInstance().getProperty(FILE_STORE));
			File file2 =new File(fileStore + file);
			BufferedReader reder = null;
			if(file2.exists()){
				StringBuilder builder = new StringBuilder();
				try {
					reder = new BufferedReader(new FileReader(file2));
					String str = null;
					while (( str = reder.readLine()) != null) {
						builder.append(str);
					}
					return builder.toString();
				} 
				finally{
					if(reder != null)
						reder.close();
				}
			}
		}
		return "No Message";
	}

}
