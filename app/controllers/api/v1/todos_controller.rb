class Api::V1::TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_todo, only: [:show, :update, :destroy]

   # GET /api/v1/todos
  def index
    @todos = Todo.all
    render json: @todos
  end

  # GET /api/v1/todos/1
  def show
    render @todos
  end

  # POST /api/v1/todos
  def create
    @todo = Todo.new(todo_params)
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

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :done)
  end
end
