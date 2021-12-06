# Preview all emails at http://localhost:3000/rails/mailers/notificationmailer_mailer
class NotificationmailerMailerPreview < ActionMailer::Preview

    def task_notification
        NotificationMailer.task_notification(User.first)
    end
    

end
