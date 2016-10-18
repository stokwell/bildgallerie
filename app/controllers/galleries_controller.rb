class GalleriesController < ApplicationController
   def index
     @galleries = Gallery.all
   end
   
  def show 
    @gallery = Gallery.find(params[:id])
    @gallery.pictures.order("created_at DESC")
   end   

  def new
    @gallery = Gallery.new
    @gallery.pictures.build
   end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to galleries_path
    else
      render 'new'
    end
  end 

  def edit
    @gallery = Gallery.find(params[:id])
  end


 def update
   @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :action => 'edit'
    end
  end

  def destroy 
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    redirect_to galleries_path
  end


 private
  def gallery_params
    params.require(:gallery).permit(:name, :gallery_id, :description, :picture_id, :pictures, pictures_attributes: [:id, :title, :author, :description])
  end

end
