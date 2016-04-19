class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.new(params[user_params])

		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit

	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		@user.update(params[user_params])
		if @user.save
			redirect_to @user
		else
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
