namespace :noticing do
        desc '課題の期限を知らせる'
        task task_notification: :environment do
          users = User.all
        
          users.each do |user|
            NotificationMailer.task_notification(user).deliver
        end
        end
end
