package com.myforms.mail;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.mail.MailException;

import com.myforms.util.PropertyEditor;
/**
 * 
 * @author mohd.irshad
 *
 */
public interface MailSender {
	
	public static String MAIL_FROM = PropertyEditor.getInstance().getProperty("mail.myforms.from");
	public static String MAIL_REPLYTO = PropertyEditor.getInstance().getProperty("mail.myforms.replyTo");
	public static String MAIL_SUBJECT = PropertyEditor.getInstance().getProperty("mail.myforms.subject");


	/**
	 * 
	 * @param mailMessage
	 * @throws IOException 
	 */
 public void prepare(MailMessage mailMessage) throws IOException;
 /**
  * 
  * @param mailMessage
  * @throws MailException
 * @throws MessagingException 
 * @throws IOException 
  */
 
 public void send(MailMessage mailMessage) throws MailException, MessagingException, IOException;
}
