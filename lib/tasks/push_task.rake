namespace :push_task do
    desc "LINEBOT：タスクの通知" 
    task :push_line_message_task => :environment do
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        limit_tasks = Post.where(datetime: DateTime.now.yesterday)
        limit_tasks.each do |t|
            message = {
                type: 'text',
                text: "「#{t.task}」の期限は明日だよ！！"
            }
            response = client.push_message(t.user_uid, message)
            p response
        end


        limit_tasks = Schedule.where(start_time: DateTime.now.yesterday)
        limit_tasks.each do |t|
            message = {
                type: 'text',
                text: "明日は「#{t.title}」だよ！！"
            }
            response = client.push_message(t.user_uid, message)
            p response
        end



    end
end