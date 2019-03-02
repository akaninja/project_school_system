class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy, :favorite, :unfavorite, :my_students, :add_list]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    @student.favorite = false
    if @student.save
      redirect_to @student
    else 
      flash[:alert] =  'Você deve preencher todos os campos'
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @user_lists = current_user.lists
  end

  def edit  
    @student = Student.find(params[:id])
    if current_user != @student.user
      redirect_to root_path
    end

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
    @students = Student.where("name like ? OR email like ?", "%#{params[:search_student]}%" , "%#{params[:search_student]}%")
    if @students.empty?
      flash[:alert] = 'Nenhum resultado encontrado'
    end
  end

  def favorite
    @student = Student.find(params[:id])
    @student.update(favorite: true)
    redirect_to root_path
  end

  def unfavorite
    @student = Student.find(params[:id])
    @student.update(favorite: false)
    redirect_to root_path
  end

  def my_students
    @my_students = current_user.students
  end
  
  def add_list
    @list = List.find(params[:list_id])
    student = Student.find(params[:id])
    ListStudent.create!(list: @list, student: student)
    redirect_to @list
  end

  private 
  def student_params
    params.require(:student).permit(:name, :phone, :email, :photo, :favorite, :user)
  end
end
