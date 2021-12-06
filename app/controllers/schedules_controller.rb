class SchedulesController < ApplicationController

    before_action :authenticate_user!


    def new
        @schedule =Schedule.new
        @schedule.start_time=params[:newdate]
    end
    
    def create
        schedule = Schedule.new(schedule_params)
        schedule.user_id = current_user.id
        schedule.save
        @schedules = current_user.schedules
        @user = current_user
    end

    def show
        @schedule = Schedule.find(params[:id])
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def destroy
        schedule = Schedule.find(params[:id])
        schedule.destroy
        #@schedules = Schedule.all.order(datetime: :asc).limit(3)
        @schedules = Schedule.where(user_id:current_user.id).order(start_time: :asc).limit(3)
        @users = User.find(current_user.id)
    end

    def update
        schedule = Schedule.find(params[:id])
        schedule.update(schedule_params)
        schedule.save
        @schedules = Schedule.where(user_id:current_user.id).order(start_time: :asc).limit(3)
        #@schedules = Schedule.all.order(datetime: :asc).limit(3)
    end

    private
    def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time)
    end
end