require 'clockwork'

require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  handler do |job|
  # 実行したい処理を記載
  Post.where("datetime < ?",  DateTime.now).delete_all
  Schedule.where("start_time < ?",  DateTime.now).delete_all
  end
  # 実行したいタイミングを指定。以下ならば、毎日・00:15（24時間表記）が来たときにのみ実行。
  every(1.minute, '1.minute.job')
end