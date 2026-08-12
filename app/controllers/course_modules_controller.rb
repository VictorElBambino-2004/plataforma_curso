class CourseModulesController < ApplicationController
  before_action :set_course
  before_action :set_course_module, only: [:edit, :update, :destroy]

  def new
    @course_module = @course.course_modules.new
  end

  def edit
  end

  def create
    @course_module = @course.course_modules.new(course_module_params)

    if @course_module.save
      redirect_to @course, notice: "El módulo fue creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @course_module.update(course_module_params)
      redirect_to @course, notice: "El módulo fue actualizado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course_module.destroy
    redirect_to @course, notice: "El módulo fue eliminado exitosamente."
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_course_module
    @course_module = @course.course_modules.find(params[:id])
  end

  def course_module_params
    params.require(:course_module).permit(:title, :description, :position, :video)
  end
end