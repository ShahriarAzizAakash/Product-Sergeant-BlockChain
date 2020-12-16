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

        @block = Block.next(ProductBlock.last, @product.upc.to_s, ProductBlock.last.hash_id)

        @newblock = ProductBlock.new(
            previous_hash: @block.previous_hash,
            upc: @block.data,
            hash_id: @block.hash
        )
        @product.brand = current_user.company_name


        if @product.save && @newblock.save
            render json:{ status: 200, product: @product, block: @block}
        else
            render json: {message: "Could not create product!"}
        end
        
    end


    private
        def product_params
            params.require(:product).permit(:name, :vendor, :origin, :upc, :expiry_date)
        end
end
require "digest"
require "pp"

class Block
    attr_reader :id 
    attr_reader :timestamp
    attr_reader :data
    attr_reader :previous_hash
    attr_reader :hash 
    attr_reader :nonce
    
    def initialize(id, data, previous_hash)
        @id = id
        @timestamp = Time.now
        @data = data 
        @previous_hash = previous_hash
        @nonce, @hash = compute_hash_with_proof_of_work 
    end

    def compute_hash_with_proof_of_work(difficulty="00")
        nonce = 0

        loop do 
            hash = compute_hash_with_nonce(nonce)

            #proof of work
            if hash.start_with?(difficulty)
                return[nonce, hash]
            else 
                nonce += 1
            end

        end
    end

    def compute_hash_with_nonce(nonce = 0)
        sha = Digest::SHA256.new
        sha.update(nonce.to_s + @id.to_s + @timestamp.to_s + @data.to_s + @previous_hash)
        sha.hexdigest
    end

    def self.next(previous, data, previous_hash)
        Block.new(previous.id + 1, data, previous_hash)
    end
end