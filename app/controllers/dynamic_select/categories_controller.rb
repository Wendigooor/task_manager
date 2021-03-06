module DynamicSelect
  class CategoriesController < ApplicationController
    respond_to :json

    def index
      @categories = Category.where(parent_id: params[:category_id])
      respond_with(@categories)
    end
  end
end
