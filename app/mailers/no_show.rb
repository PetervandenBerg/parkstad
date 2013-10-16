class NoShow < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.no_show.reminder.subject
  #
  def reminder
    @greeting = "Hallo, je hebt nog niet aangegeven of je aanwezig bent voor de aankomende wedstrijd of training. Doe dit vandaag nog anders wordt je automisch afwezig gemeld."

    mail to: "peter_vd_berg@hotmail.com", subject: "Parkstad, doorgeven van je aanwezigheid"
  end
end
