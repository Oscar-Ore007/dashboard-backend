class ListsController < ApplicationController
    def index 
        @lists = List.all 

        render json: ListSerializer.new(@lists)
    end 

    def show 
        @list = List.find(params[:id])
        render json: @list 
    end 

    def create 
        @list = List.create(list_params)

        if @list.valid?
            render json: @list 
        else 
            render json: { errors: @list.errors.full_messages }, status: :not_acceptable
        end
    end 

    def delete 
        @list = List.find(params[:id])
        @list.destroy 
    end 

    private 

    def list_params 
        params.permit(:name, :project_id)
    end 
end
