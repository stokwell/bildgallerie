class GalleriesController < ApplicationController
  def index
     @galleries = Gallery.all.order(created_at: :desc)
     @gallery = Gallery.new
  end
   
  def show 
    @gallery = Gallery.find(params[:id])
    @pictures = @gallery.pictures.all.order(created_at: :desc)
  end   

  def new
    @gallery = Gallery.new
    @gallery.pictures.build
  end

  def create
    respond_to do |format|
       @gallery = Gallery.new(gallery_params)
       @gallery.save
       format.html { redirect_to galleries_path }
       format.js   
   end
  end 

  def edit
    @gallery = Gallery.find(params[:id])
  end


 def update
   respond_to do |format|
     @gallery = Gallery.find(params[:id])
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




private
  def gallery_params
    params.require(:gallery).permit( :image, :name, :gallery_id, :description, :picture_id, :pictures, pictures_attributes: [:id, :title, :author, :description])
  end

end
