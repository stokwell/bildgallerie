class WelcomeController < ApplicationController
 
  def index
    @galleries = Gallery.where(:published => true).all
  end


end
