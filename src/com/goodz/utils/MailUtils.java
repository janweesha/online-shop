package com.goodz.utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

//基于JavaMail发送邮件
public class MailUtils
{
	public static void sendMail(String from,String to,String content) throws Exception
	{
		try {
			//1.创建一个应用程序与邮件服务器的会话session
			final Properties props=new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");//指定验证为true
			
			props.put("mail.host", "smtp.126.com");//126邮箱发送服务器
			props.put("username", "janwee_sha");//用户名
			props.put("authKey", "janwee126");//授权码
			
			
			/*props.put("mail.host", "smtp.qq.com");//126邮箱发送服务器
			props.put("username", "1377860780@qq.com");//用户名
			props.put("authKey", "ooyrzrklnhzzjbag");//授权码
*/			
			//创建验证器
			Authenticator auth=new Authenticator()
			{
					public PasswordAuthentication getPasswordAuthentication()
					{
						return new PasswordAuthentication(props.getProperty("username"), props.getProperty("authKey"));
					}
			};
			
			Session session=Session.getInstance(props, auth);
			session.setDebug(false);//+++++++++++++++++++++++++++++
			
			//创建邮件
			Message message=createMessage(session,from,to,content);
			// 构件MimeMessage 对象，并设置在发送给收信人之前给自己（发送方）抄送一份
			//message.addRecipients(MimeMessage.RecipientType.CC, InternetAddress.parse("janwee_sha@163.com"));
			//发送邮件
			Transport transport=session.getTransport();
			Address[] addresses={new InternetAddress(to)};
			transport.connect();
			transport.sendMessage(message,addresses);
			//Transport.send(message);
			System.out.println("邮件已发送！");
			transport.close();
		} catch (MessagingException e)
		{
			System.out.println("邮件被退回！");
			throw e;
		}
	}
	
	
	public static Message createMessage(Session session,String from,String to,String msg) throws Exception
	{
		String subject="success";
		Date sentDate=new Date();
		//创建一封邮件
		MimeMessage message=new MimeMessage(session);
		//from
		message.setFrom(new InternetAddress(from));
		//给自己抄送一份
		//message.addRecipients(RecipientType.CC, InternetAddress.parse(from));
		//to
		message.addRecipients(RecipientType.TO, InternetAddress.parse(to));
		//subject
		message.setSubject(subject);
		//发送时间
		message.setSentDate(sentDate);
		//内容
		MimeBodyPart text=new MimeBodyPart();
		text.setContent("<font style='color: blue;'>"+msg+"</font>","text/html;charset=utf-8");
		
		MimeMultipart multipart=new MimeMultipart();
		multipart.addBodyPart(text);
		
		//将内容加到message
		message.setContent(multipart);
		message.saveChanges();//++++++++++
		
		return message;
	}
	
	public static void main(String[] args) throws Exception
	{
		//MailUtils.sendMail("1377860780@qq.com","1377860780@qq.com","恭喜你，注册成功！请激活。");
		MailUtils.sendMail("janwee_sha@126.com","janwee_sha@126.com","successfully registered。");
	}
}
