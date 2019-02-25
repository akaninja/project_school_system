class HomeController < ApplicationController
  
  def index
    @teachers = Teacher.all

    if params[:search_student]
      @students = Student.where(name: "#{params[:search_student]}")
        if @students.empty?
          flash[:alert] = 'Nenhum aluno encontrado'
        end
    else
      @students = Student.all
    end
  end
  
end