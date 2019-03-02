class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
  end

  def create
    list = List.create(title: params[:title], user: current_user)
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
  end

end
