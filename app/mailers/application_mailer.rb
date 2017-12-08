class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end

class UserMailer < ApplicationMailer
end
