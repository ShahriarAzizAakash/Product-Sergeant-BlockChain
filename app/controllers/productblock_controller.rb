class ProductblockController < ApplicationController
    def index 
        @blocks = ProductBlock.all
        render json: {blocks: @blocks}
    end
end
