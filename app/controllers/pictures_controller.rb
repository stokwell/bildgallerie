class PicturesController < ApplicationController
 def index
    @pictures = Picture.all
 end

 def show
    @gallery= Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
 end

 def create

    @gallery= Gallery.find(params[:gallery_id])
    params[:picture]['image'].each do |a|
    @picture = @gallery.pictures.create!(:image => a)
  end
  
    redirect_to gallery_path(@gallery)
 end

 def edit
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
 end 

 def update
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
    if @picture.update_attributes(params[:picture].permit(:title, :author, :description))
    redirect_to gallery_path(@gallery)
  else
    render 'edit'
  end
end



 def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
    @picture.destroy
    redirect_to gallery_path(@gallery)
 end


  
  private
  def picture_params
    params.require(:picture).permit(:image[], :pictures_attributes [:id, :title, :author, :description], :gallery, :title, :gallery_id, :description, :author)
  end

end
