package grailssecurity
class EmailService {

    boolean transactional = false

    def sendEmail(attrs) {
        sendJMSMessage("sendMail",
                [to: attrs.to,
                 from: attrs.from,
                 subject: attrs.subject,
                 view: attrs.view,
                 model: attrs.model])
    }
}
