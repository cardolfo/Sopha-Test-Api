module V1
    class StoresController < ApplicationController
        
        def create
            @store = Store.new(store_params)
            @store.save!
            render status: :created, json: @store.as_json.target!
        end

        def show            
            @store = Store.where(id: store_params[:id])
            raise Errors::StoreNotFound if @store.empty?
            render status: :ok, json: @store.first.as_json.target!
        end

        def update
            @store = Store.where(id: store_params[:id])
            raise Errors::StoreNotFound if @store.empty?
            @store.first.update store_params
            render status: :ok, json: @store.first.as_json.target!
        end

        def destroy
            @store = Store.where(id: store_params[:id])
            raise Errors::StoreNotFound if @store.empty?
            @store.first.destroy
            render status: :ok, json: { message: "Removed" }
        end

        private 

        def store_params
            params.permit(:name,:id)
        end

    end
end

