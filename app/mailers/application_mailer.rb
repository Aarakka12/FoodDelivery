class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  default from: User::MAILER_FROM_EMAIL
end
