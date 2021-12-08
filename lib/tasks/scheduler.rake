desc "This task is called by the Heroku scheduler add-on"
task :table_updating => :environment do
    Post.where("datetime < ?",  DateTime.now).delete_all
    Schedule.where("start_time < ?",  DateTime.now).delete_all
end

task :send_reminders => :environment do
  User.send_reminders
end