class UsersController < ApplicationController


    def show
        @user = User.find(current_user.id) 
        @schedules = @user.schedules
    end





    private
    def schedule_params
        params.require(:schedule).permit(:title, :content, :start_time )
    end

end
