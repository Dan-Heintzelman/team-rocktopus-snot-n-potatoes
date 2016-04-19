class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.new(params[:user])

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

		@user.update(params[:user])
		if @user.save
			redirect_to @user
		else
			render 'edit'
		end
	end
end
