class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only:[:show,:edit,:destroy,:update]

  before_action :set_user, only: [:create,:index]

  def new
    @todo = Todo.new()
  end

  def create
   @todo = @user.todos.new(todo_params)
   if @todo.save()
     flash[:succes] = "Todo was created";
       redirect_to todo_path(@todo)
     else
       render 'new';
   end
  end

def show
end

def edit
end

def todos_user()
    @user = User.find(params[:id]);
    @todos = @user.todos.all()
end

def index
    @todos = @user.todos.all()
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

   def set_user
    @user = current_user
   end

  def set_todo
  @todo = Todo.find(params[:id])
  end

  def todo_params
      params.require(:todo).permit(:name,:description,:user)
  end
end
