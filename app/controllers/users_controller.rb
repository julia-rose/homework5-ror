class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Account created successfully!"
			redirect_to user_path @user
		else
			flash[:alert] = "There was a problem creating your account."
			redirect_to new_user_path 
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find params[:id] 
	end

	def show
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		@user.update_attributes(params[:user])
		if @user.save
			flash[:notice] = "Account edited successfully!"
			redirect_to user_path @user
		else
			flash[:alert] = "There was a problem editing your account."
			redirect_to edit_user_path @user
		end
	end

	def destroy
		@user = User.find params[:id]
	end


end
