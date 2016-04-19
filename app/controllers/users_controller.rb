class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			puts "user didn't save"
			render 'new'
		end
	end

	def edit

	end

	def show
		@user = User.find(params[:id])
		@favorites = @user.favorited_movies.shuffle[0..4]
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
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
