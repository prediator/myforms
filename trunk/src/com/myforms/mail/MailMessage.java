package com.myforms.mail;

import org.springframework.mail.SimpleMailMessage;

public class MailMessage extends SimpleMailMessage{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String messageKey;
	/**
	 * 
	 */
	private boolean isHTML;

	private String messageParams[];
	public String[] getMessageParams() {
		return messageParams;
	}

	public void setMessageParams(String[] messageParams) {
		this.messageParams = messageParams;
	}

	public String getMessageKey() {
		return messageKey;
	}

	public void setMessageKey(String messageKey) {
		this.messageKey = messageKey;
	}

	public boolean isHTML() {
		return isHTML;
	}

	public void setHTML(boolean isHTML) {
		this.isHTML = isHTML;
	}
}
