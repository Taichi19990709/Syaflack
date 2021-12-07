class PostsController < ApplicationController

    before_action :authenticate_user!

    def index
        #if params[:search] == nil
            #@posts = Post.all.order(datetime: :asc).limit(5)
            #@schedules = Schedule.order(start_time: :asc).limit(3)
            @post = Post.new
            @posts = Post.where(user_id:current_user.id).order(datetime: :asc).limit(5)
            @schedules = Schedule.where(user_id:current_user.id).order(start_time: :asc).limit(3)

            # elsif params[:search] == ''
            #@posts = Post.all.order(datetime: :asc).limit(5)
            #@schedules = Schedule.order(start_time: :asc).limit(3)
            #@post = Post.new
            #else
            #@schedules = Schedule.order(start_time: :asc).limit(3)
            #@posts = Post.where("task LIKE ? ",'%' + params[:search] + '%')
            #@post = Post.new
        #end
    end

    def new
        @post = Post.new
        @schedule =Schedule.new
    end

    def calendar
        @events = Post.all
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        post.save
        #@posts = Post.all.order(datetime: :asc).limit(5)
        @posts = Post.where(user_id:current_user.id).order(datetime: :asc).limit(5)

    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        # binding pry
        post=Post.find(params[:id])
        post.update(post_params)
        post.save
        #@posts = Post.all.order(datetime: :asc).limit(5)
        @posts = Post.where(user_id:current_user.id).order(datetime: :asc).limit(5)

    
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        #@posts =Post.all.order(datetime: :asc).limit(5)
        @posts = Post.where(user_id:current_user.id).order(datetime: :asc).limit(5)

    end

    def search
        if params[:search] == nil
            @posts= Post.all
        elsif params[:search] == ''
            @Posts= Post.all
        else
            @posts = Post.where("task LIKE ?", '%' + params[:search] + '%')
        end
    end

    private
    def post_params
    params.require(:post).permit(:task, :datetime, :importanceoftask,)
    end

end
