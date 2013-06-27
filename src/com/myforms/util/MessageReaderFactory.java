package com.myforms.util;

public class MessageReaderFactory {
public static MessageReader getMessageReader(String type){
	return new MessageReaderImpl();
}
}
