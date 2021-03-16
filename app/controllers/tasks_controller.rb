class TasksController < ApplicationController
    def index 
        @tasks = Task.all 
        render json: TaskSerializer.new(@tasks)
    end 

    def show
        @task = Task.find(params[:id])
        render json: TaskSerializer.new(@tasks)
    end 

    def create 
        @task = Task.create(task_params)
        if @task.valid?
            render json: TaskSerializer.new(@task)
        else
            render json: { errors: @task.errors.full_messages }, status: :not_acceptable
        end 
    end 

    def delete 
        @task = Task.find(params[:id])
        @task.destroy 
    end 

    private 

    def task_params 
        params.permit(:content, :list_id)
    end 
end
