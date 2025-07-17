package controlador.mail;

import java.io.File;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Correo {

    private String EMAIL = "rodrigoignacio.fa@gmail.com";
    private String PASSWORD = "ufaa gqif vszs qqex";
    private String destinatario;
    private String asunto;
    private String contenidoHtml;
    private File[] adjunto;
    private Properties properties;
    private Authenticator auth;

    public Correo() {
        properties = new Properties();

        // Configuración SMTP para Gmail
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.user", EMAIL);
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.auth", "true");

        // Autenticación
        auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL, PASSWORD);
            }
        };
    }

    // Método para enviar correo HTML con archivos adjuntos opcionales
    public boolean enviarCorreo() {
        boolean correoEnviado = false;

        try {
            Session session = Session.getInstance(properties, auth);
            Message msg = new MimeMessage(session);

            // Establecer los campos del correo
            msg.setFrom(new InternetAddress(EMAIL));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            msg.setSubject(asunto);

            // Crear la parte de texto con formato HTML
            MimeBodyPart texto = new MimeBodyPart();
            texto.setContent(contenidoHtml, "text/html");

            // Crear el objeto Multipart para incluir texto y adjuntos
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(texto);

            // Agregar los adjuntos, si existen
            if (adjunto != null) {
                for (File archivo : adjunto) {
                    MimeBodyPart adjuntoParte = new MimeBodyPart();
                    FileDataSource fds = new FileDataSource(archivo);
                    adjuntoParte.setDataHandler(new DataHandler(fds));
                    adjuntoParte.setFileName(archivo.getName());
                    multipart.addBodyPart(adjuntoParte);
                }
            }

            // Establecer el contenido del mensaje
            msg.setContent(multipart);

            // Enviar el correo
            Transport.send(msg);
            correoEnviado = true;
            System.out.println("Correo enviado con éxito.");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al enviar el correo.");
        }

        return correoEnviado;
    }

    // Métodos para configurar los parámetros del correo (destinatario, asunto, contenido HTML, y adjuntos)
    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public void setContenidoHtml(String contenidoHtml) {
        this.contenidoHtml = contenidoHtml;
    }

    public void setAdjuntos(File[] adjunto) {
        this.adjunto = adjunto;
    }
}
    

