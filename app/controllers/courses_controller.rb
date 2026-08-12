class CoursesController < ApplicationController
  before_action :set_course, only: %w[show edit update destroy]

  def index
    @courses = Course.all
  end

  def show
    @course_modules = @course.course_modules.order(:position)
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "El curso fue creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: "El curso fue actualizado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "El curso fue eliminado exitosamente.", status: :see_other
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end
end