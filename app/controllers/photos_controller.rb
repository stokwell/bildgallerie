class PhotosController < ApplicationController
 def index
    @photos = Photo.all
  end

  def show
    @photos = Photo.all
  end

  def new 
     @photos = Photo.order('created_at DESC')
     @photo = Photo.new
  end

  def edit
   @photo= Photo.find(params[:id])
  end  


  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

 def create
    @photos = Photo.order('created_at DESC')
    @photo = Photo.new
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
 end


  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

  def update
  @photo = Photo.find(params[:id])
 
  if @photo.update(photo_params)
    redirect_to '/photos'
  else
    render 'edit'
  end
end
 

  private
  def photo_params
    params.require(:photo).permit(:image, :title, :author, :text)
  end
end
