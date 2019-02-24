class HomeController < ApplicationController
  
  def index
    @students = Student.all
    @teachers = Teacher.all
  end
  
end
