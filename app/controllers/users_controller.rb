class UsersController < ApplicationController
    def create 
        @user = User.new(user_params)

        if @user.save 
            render json: {status: 200, user: @user.company_name}
        else
            render json: {status: :unprocessible_entity}
        end
    end

    private
        def user_params
            params.require(:user).permit(:company_name, :username, :email, :password, :password_confirmation)
        end
end
