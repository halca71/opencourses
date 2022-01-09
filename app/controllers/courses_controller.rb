class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :adlogged_in, only: [:edit, :update]

  def index
    @courses = Course.all
    @pagy, @courses = pagy(@courses.order(id: :desc))
  end

  def show
    set_course
    set_category
  end
  
  def new
    @course = Course.new
  end

  def create
    @course = current_admin.courses.build(course_params)
    if @course.save
      flash[:success] = '講座を追加しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '講座の追加に失敗しました。'
      render new_course_path
    end
  end

  def edit
  end
  
  def update
    if @course.update(course_params)
      flash[:success] = '正常に更新されました'
      redirect_to @course
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_course
    @course.destroy
    flash[:success] = '削除しました。'
    redirect_to root_url 
  end
  
  private

  def set_category
    @category = Category.find(@course.category_id)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name, :teacher_name, :date, :status, :photo, :content, :category_id, :category_name)
  end
  
  def adlogged_in
    unless adlogged_in?
      redirect_to root_url
    end
  end

end
