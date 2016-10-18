class UsersImagesController < ApplicationController
 
 before_action :require_user, only: [:show, :edit, :update, :destroy]
 before_action :require_editor, only: [:show, :edit]

def index
  @users_images = current_user.users_images.all
end  

def show
  @users_image = current_user.users_images.find(params[:id])
end

def new
  @users_image = current_user.users_images.new
end

def create
  @users_image = current_user.users_images.new(users_image_params)
  if @users_image.save
    redirect_to users_images_path
  else
    render 'new'
  end
end 

def edit
  @users_image = current_user.users_images.find(params[:id])
end

def update
   @users_image = current_user.users_images.find(params[:id])
 
  if @users_image.update(users_image_params)
    redirect_to '/users_images'
  else
    render 'edit'
  end
end

def destroy
  @users_image = current_user.users_images.find(params[:id])
  @users_image.destroy
  redirect_to users_images_path
end

private
  def users_image_params
    params.require(:users_image).permit(:image, :title, :author, :description)
  end
end

