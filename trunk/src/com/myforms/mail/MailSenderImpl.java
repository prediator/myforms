package com.myforms.mail;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang.StringUtils;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.myforms.exception.runtimeexception.Message;
import com.myforms.util.MessageReader;
import com.myforms.util.MessageReaderFactory;

public class MailSenderImpl implements MailSender {
	private JavaMailSender javaMailSender;
	@Override
	public void send(MailMessage mailMessage) throws MailException, MessagingException, IOException {
		prepare(mailMessage);
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo(mailMessage.getTo());
		helper.setText(mailMessage.getText(), mailMessage.isHTML());
		helper.setFrom(mailMessage.getFrom());
		helper.setSubject(mailMessage.getSubject());
		javaMailSender.send(message);
	}

	@Override
	public void prepare(MailMessage mailMessage) throws IOException {
		if(StringUtils.isEmpty(mailMessage.getSubject())){
			mailMessage.setSubject(MAIL_SUBJECT);
		}
		if(StringUtils.isEmpty(mailMessage.getReplyTo())){
			mailMessage.setReplyTo(MAIL_REPLYTO);		
		}
		if(StringUtils.isEmpty(mailMessage.getFrom())){
			mailMessage.setFrom(MAIL_FROM);
		}
		if(!StringUtils.isEmpty(mailMessage.getMessageKey())){
			String messageKey = mailMessage.getMessageKey();
			String message = MessageReaderFactory.getMessageReader(null).read(messageKey);
			if(mailMessage.getMessageParams() != null)
				message = Message.getMessage(message, mailMessage.getMessageParams());
			mailMessage.setText(message);
		}
	}

	public JavaMailSender getJavaMailSender() {
		return javaMailSender;
	}

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	

}
