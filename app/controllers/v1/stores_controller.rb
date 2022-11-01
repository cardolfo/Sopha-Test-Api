module V1
    class StoresController < ApplicationController
        before_action :find_store, only:[:show, :update, :destroy]
        
        def create
            @store = Store.new(store_params)
            @store.save!
            render status: :created, json: @store.as_json.target!
        end

        def show            
            render status: :ok, json: @store.first.as_json.target!
        end

        def update            
            @store.first.update store_params
            render status: :ok, json: @store.first.as_json.target!
        end

        def destroy
            @store.first.destroy
            render status: :ok, json: { message: "Removed" }
        end

        private 

        def store_params
            params.require(:store).permit(:name)
        end

        def find_store
            @store = Store.where(id: params[:id])
            raise Errors::StoreNotFound if @store.empty?
        end

    end
end

