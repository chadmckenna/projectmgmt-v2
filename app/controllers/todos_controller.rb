class TodosController < ApplicationController
  before_action :set_todoable, only: %i[ index new create ]
  before_action :set_todo, only: %i[ show edit update destroy ]

  def index
    @todos = @todoable.todos
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = @todoable.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.expect(todo: [ :description, :complete, :todoable_id ])
    end
end

class Client::TodosController < ::TodosController
  private
    def set_todoable
      @todoable = Client.find(params.expect(:client_id))
    end
end

class Project::TodosController < ::TodosController
  private
    def set_todoable
      @todoable = Project.find(params.expect(:project_id))
    end
end
