class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  #Get /todos
  def index
    @todos = Todo.order("created_at DESC")
    render json: @todos
  end

  # GET /todos/:id
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  def by_finished
    todo_finished = params[:finished]
    @todos = Todo.where(:finished => todo_finished)
    render json: @todos
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_user
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :description, :finished)
    end
end
