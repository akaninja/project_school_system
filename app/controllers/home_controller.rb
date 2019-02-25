class HomeController < ApplicationController
  
  def index

    flash[:alert_student] = ''
    flash[:alert_teacher] = ''
    if params[:search_student]
      @students = Student.where(name: "#{params[:search_student]}")
        if @students.empty?
          flash[:alert_student] = 'Nenhum aluno encontrado'
        end
    else
      @students = Student.all
    end

    if params[:search_teacher]
      @teachers = Teacher.where(name: "#{params[:search_teacher]}")
        if @teachers.empty?
          flash[:alert_teacher] = 'Nenhum professor encontrado'
        end
    else
      @teachers = Teacher.all
    end

  end

end