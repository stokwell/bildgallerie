class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :destroy]

  def index
     @galleries = Gallery.all.order(created_at: :desc)
     @gallery = Gallery.new
  end

  def show
    @gallery = Gallery.find(params[:id])
    @pictures= @gallery.pictures.order(created_at: :desc).limit(10)
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.create(gallery_params)
    @gallery.user = current_user
    if @gallery.save
      if params[:gallery][:avatar].present?
        render :crop
      else
        flash[:notice] = "new gallery was successfully created"
        redirect_to gallery_path(@gallery)
     end
    else
      flash[:notice] = "Can't create new gallery"
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @pictures = @gallery.pictures.all.order(created_at: :desc)
  end


 def update
   @gallery = Gallery.find(params[:id])
   respond_to do |format|
     @gallery.update(gallery_params)
     format.html {  redirect_to @gallery}
     format.js
    end
 end

 def destroy
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
    @gallery.destroy
    format.js
    format.html { redirect_to galleries_path }
  end
 end

 def published
  @gallery = Gallery.find(params[:id])
  @gallery.update(published: true)
  flash[:notice] = "This gallery is published"
 end

private

  def gallery_params
    params.require(:gallery).permit(:avatar, :crop_x, :crop_y, :crop_w, :crop_h, :image, :name, :gallery_id, :description, :picture_id, pictures_attributes: [:id, :title, :author, :description])
  end

end
