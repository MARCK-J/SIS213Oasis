package com.ucb.SIS213.Oasis.email.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ucb.SIS213.Oasis.email.Model.MailStructure;

@Service
public class MailService {
    
    @Autowired
    private JavaMailSender mailSender;
    @Value("${spring.mail.username}")
    private String fromMail;

    public void sendMail(String mail, MailStructure mailStructure){
        SimpleMailMessage mensaje = new SimpleMailMessage();
        mensaje.setFrom(fromMail);
        mensaje.setSubject(mailStructure.getSubject());
        mensaje.setText(mailStructure.getMessage());
        mensaje.setTo(mail);

        mailSender.send(mensaje);    }

}
