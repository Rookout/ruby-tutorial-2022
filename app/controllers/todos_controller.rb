require 'securerandom'

$todos_storage = []

class TodosController < ApplicationController
  # GET '/todos'
  def index
    @todos = $todos_storage
    render json: @todos
  end

  # GET '/todos/:id'
  def get_todo
    id = params[:id].to_s
    @todo = $todos_storage.find { |t| t.id == id }
    render json: @todo
  end

  # POST '/todos'
  def create
    params.require(:todo).permit(:title, :completed, :order)
    uuid = SecureRandom.uuid
    url = "#{request.original_url}/#{uuid}"
    orderIfSpecified = params[:todo][:order] != nil ? params[:todo][:order].to_i : nil
    @todo = Todo.new(uuid, params[:todo][:title], url, false, orderIfSpecified)
    $todos_storage.push(@todo)
    render json: @todo
  end

  # PATCH '/todos/:id'
  def update
    params.require(:todo).permit(:title, :completed, :order, :id)
    id = params[:id].to_s
    @todo = $todos_storage.find { |t| t.id == id }
    if params[:todo][:title]
      @todo.title = params[:todo][:title]
      $todos_storage.delete_if { |t| t.id == id }
      $todos_storage.push(@todo)
    end
    if params[:todo][:completed]
      completed = params[:todo][:completed].to_s == "true" # convert param to bool
      @todo.completed = completed
      $todos_storage.delete_if { |t| t.id == id }
      $todos_storage.push(@todo)
    end
    if params[:todo][:order]
      order = params[:todo][:order].to_i # convert param to int
      @todo.order = order
      $todos_storage.delete_if { |t| t.id == id }
      $todos_storage.push(@todo)
    end
    render json: @todo
  end

  # DELETE '/todos/:id'
  def destroy
    id = params[:id].to_s
    $todos_storage.delete_if { |t| t.id == id }
  end

  # DELETE '/todos'
  def delete_all
    $todos_storage.clear()
  end
end
