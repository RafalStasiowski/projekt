class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default :from =>  "slazaczka@gmail.com"
  layout 'mailer'
end
