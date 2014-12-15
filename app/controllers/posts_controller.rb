class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@posts = Post.all

	end

	def new
		@post = Post.new
	end

	def edit
	end

  def create
    #@post = Post.new(post_params)

    @user = User.find(params[:user_id])
    @post = @user.posts.new(params[:post])

    	if @post.save
       		flash[:notice] = "Post created successfully!"
       		redirect_to user_posts_path @user
  	 	else
  	 		flash[:alert] = "There was a problem creating your post."
  	 		redirect_to new_user_posts_path @user
     	end
  	end
end
