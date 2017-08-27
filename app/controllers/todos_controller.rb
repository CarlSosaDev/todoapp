class TodosController < ApplicationController
  before_action :set_todo, only:[:show,:edit,:destroy,:update]
  def new
    @todo = Todo.new()
  end

  def create
   @todo = Todo.new(todo_params)
   if @todo.save
     flash[:succes] = "Todo was created"
       redirect_to todo_path(@todo)
     else
       render 'new'
   end
  end

def show
end
def edit
end

def index
   @todos = Todo.all
end

def destroy
  @todo.destroy
  flash[:succes] = "Todo was succesfully deleted"
  redirect_to todos_path
end

def update
  if @todo.update(todo_params)
    flash[:success] = "Todo was succesfully updated"
    redirect_to todo_path(@todo)
  else
    render 'edit'
  end
end

private

  def set_todo
  @todo = Todo.find(params[:id])
  end

  def todo_params
      params.require(:todo).permit(:name,:description)
  end
end
