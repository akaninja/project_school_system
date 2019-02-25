class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else 
      flash[:alert] =  'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      flash[:alert] = "Não foi possível salvar alterações"
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path
  end

  private 
  def student_params
    params.require(:student).permit(:name, :phone, :email, :photo)
  end
end
