class Post < ApplicationRecord
    belongs_to :user
    validates :datetime, presence: true
    validates :task, presence: true
    validates :importanceoftask, presence: true

    validate :date_before_start

    def date_before_start
        return if datetime.blank? 
        errors.add(:datetime,"は今日以降のものを選択してください")if datetime < Date.today
    end
        
    



end
