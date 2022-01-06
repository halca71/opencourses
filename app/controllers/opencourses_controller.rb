class OpencoursesController < ApplicationController
  def index
    @courses = Course.includes(:admin).sample(3)  
  end
end
