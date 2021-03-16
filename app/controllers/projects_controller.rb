class ProjectsController < ApplicationController

    def index 
        @projects = Project.all 

        render json: ProjectSerializer.new(@projects)

    end 

    def show
        @project = Project.find(params[:id])
        render json: ProjectSerializer.new(@project) 
    end 

    def create 
        @project = Project.create(project_params)
        if @project.valid?
            render json: ProjectSerializer.new(@project)
        else 
            render json: { errors: @project.errors.full_messages }, status: :not_acceptable
        end 
    end 

    def delete 
        @project = Project.find(params[:id])
        @project.destroy 
    end 

    private 

    def project_params
        params.permit(:name, :user_id)
    end 
end
