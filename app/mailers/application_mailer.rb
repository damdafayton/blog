class ApplicationMailer < ActionMailer::Base
  default from: 'hello-but-dont-reply@damdafayton-blog.herokuapp.com/'
  layout 'mailer'
end
