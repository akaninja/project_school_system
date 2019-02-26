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

  def search
    # @students = Student.where("name like ? OR email like ?", params[:search_student], params[:search_student])
    # if @students.empty?
    #   flash[:alert] = 'Nenhum resultado encontrado'
    # end

    @students = Student.all
    @students_found = []
    @students.each do |student|
      if student.name.downcase.include? params[:search_student].downcase
        @students_found << student
      elsif student.email.downcase.include? params[:search_student].downcase
          @students_found << student
      end
      if @students_found.empty?
        flash[:alert] = 'Nenhum resultado encontrado'
      end
    end

  end

  private 
  def student_params
    params.require(:student).permit(:name, :phone, :email, :photo)
  end
end
