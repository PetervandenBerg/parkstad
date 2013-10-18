class ParkstadMailer < ActionMailer::Base
  default from: "noreply@parkstad3.nl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.no_show.reminder.subject
  #
  def reminder(user)
    @reminder = "Hallo #{user.name}, je hebt nog niet aangegeven of je aanwezig bent voor de aankomende wedstrijd of training. Doe dit vandaag nog anders wordt je automisch afwezig gemeld. Dit is een automatisch bericht, niet op reageren aub."

    mail to: user.email, subject: "Parkstad, doorgeven van je aanwezigheid", bcc: "peter_vd_berg@hotmail.com"
  end

  def cancel_training(user)
    @cancel_training = "Hallo #{user.name}, Er zijn te weinig mensen aangemeld voor de training van vanavond. De training gaat niet door. Tot volgende week.Dit is een automatisch bericht, niet op reageren aub."
    
    mail to: user.email, subject: "Parkstad, Training van vanavond gaat niet door.", bcc: "peter_vd_berg@hotmail.com"
  end
end
