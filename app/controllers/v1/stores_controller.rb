module V1
    class StoresController < ApplicationController
        
        def create
            @store = Store.new(store_params)
            @store.save!
            render status: :created, json: @store.as_json.target!
        end

        def show
            @store = Store.find(store_params[:id])
            render status: :ok, json: @store.as_json.target!
        end

        private 

        def store_params
            params.permit(:name,:id)
        end

    end
end

