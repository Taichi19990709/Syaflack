class Schedule < ApplicationRecord
    belongs_to :user
    
    def self.schedule_destroy
        time = Time.now 
        schedules = Schedule.all
            if schedules.start_time < time
                schedules.destroy
            end

    end
end
