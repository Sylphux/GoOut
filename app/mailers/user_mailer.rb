class UserMailer < ApplicationMailer
    default from: ENV["GMAIL_LOGIN"]

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'cool le mail')
    end

end
