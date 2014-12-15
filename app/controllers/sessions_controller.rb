class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "Logged in succesfully"
			redirect_to user_path @user
		else
			flash[:alert] = "You do not have an account"
			redirect_to new_session_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to users_path
	end

end
