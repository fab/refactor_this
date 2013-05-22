class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    params[:todo][:list_name] = params[:todo][:list_name].parameterize
    @todo = Todo.new(params[:todo])
    if @todo.save
      redirect_to root_url
    else
      flash[:notice] = "Something went wrong! Try again."
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    params[:todo][:list_name] = params[:todo][:list_name].parameterize
    if @todo.update_attributes(params[:todo])
      redirect_to @todo
    else
      flash[:notice] = "Something went wrong! Try again."
      render :edit
    end
  end

end
