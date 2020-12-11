class ProductsController < ApplicationController
    before_action :authorize_access_request!, except: [:index, :search, :show]

    def index 
        @products = Product.all
        render json: {products: @products}
    end

    def search
        if Product.exists?(upc: params[:upc])
            @product = Product.find_by(upc: params[:upc])
            render json: {product: @product}
            if @product.scanned != true
                @product.update_attribute(:scanned, true)
            end
        else
            render json: {status: 404, message: "Not Found"}
        end
    end

    def create 
        @product = Product.new(product_params)
        @product.brand = current_user.company_name
        if @product.save 
            render json:{ status: 200, product: @product}
        else
            render json: {message: "Could not create product!"}
        end
    end


    private
        def product_params
            params.require(:product).permit(:name, :vendor, :origin, :upc, :expiry_date)
        end
end
