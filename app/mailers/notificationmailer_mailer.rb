class NotificationmailerMailer < ApplicationMailer
    def task_notification(user)
        @user = user

    mail to: "#{@user.email}", subject: "やばいぞ, #{@user.name}"

    end
end
