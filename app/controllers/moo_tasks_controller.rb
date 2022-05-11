class MooTasksController < ApplicationController
  before_action :set_moo_task, only: %i[ show edit update destroy ]

  def index
    if params[:status] == 'done'
      @moo_tasks = MooTask.where(status: 'done')
    elsif params[:status] == 'all'
      @moo_tasks = MooTask.all
    else
      @moo_tasks = MooTask.where(status: 'new')
    end
    @moo_task = MooTask.new
  end

  def show
  end

  def new
    @moo_task = MooTask.new
  end

  def edit
  end

  def create
    @moo_task = MooTask.new(moo_task_params)

    if @moo_task.save
      redirect_to action: "index", notice: "Moo task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @moo_task.update(moo_task_params)
      redirect_to action: 'index', notice: "Moo task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /moo_tasks/1
  def destroy
    @moo_task.destroy
    redirect_to moo_tasks_url, notice: "Moo task was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moo_task
      @moo_task = MooTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moo_task_params
      params.require(:moo_task).permit(:name, :status, :notes, :category)
    end
end
