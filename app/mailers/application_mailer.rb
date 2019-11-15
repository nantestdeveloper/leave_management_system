class ApplicationMailer < ActionMailer::Base
  default from: 'nandev9087@gmail.com'
  layout 'mailer'

  def send_mail_of_leave(email,leave,subj_content)
  	@user = email
  	@leave = leave
    mail(to: email, subject: subj_content)
  end
end
