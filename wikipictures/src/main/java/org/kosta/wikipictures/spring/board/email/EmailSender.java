package org.kosta.wikipictures.spring.board.email;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

/*import com.bean.Email;*/

@Component
public class EmailSender {
     
    @Autowired
    protected JavaMailSender mailSender;
 
    public void SendEmail(Email email) throws Exception {
    	String from = "mandoopi6254@gmail.com";
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
        msg.setText(email.getContent(),"utf-8", "html");
        msg.setFrom(new InternetAddress(from));
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReciver()));
        mailSender.send(msg); 
    }
}
