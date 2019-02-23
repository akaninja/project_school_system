class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    redirect_to @teacher
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

    private 
  def teacher_params
    params.require(:teacher).permit(:name, :phone, :email)
  end

end
