module Api 
  module V1
    class FriendsController < Api::V1::ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      def index
        friends = Friend.order('created_at DESC')
        render json: {status: 'SUCCESS' , message: 'Loaded Friends' , data:friends }, status: :ok
      end

      def show
        friend = Friend.find(params[:id])
        render json: {status: 'SUCCESS' , message: 'Loaded Friend' , data:friend }, status: :ok
      end

      def create
        friend = Friend.new(friend_params)
        if friend.save
          render json: {status: 'SUCCESS' , message: 'Save Friend' , data:friend }, status: :ok
        else
          render json: {status: 'ERROR' , message: 'Friend not saved' , data:friend.errors }, status: :unprocessable_entity
        end
      end

      def destroy 
        friend = Friend.find(params[:id])
        friend.destroy
        render json: {status: 'SUCCESS' , message: 'Deleted Friend' , data:friend }, status: :ok
      end

      def update
        friend = Friend.find(params[:id])
        if friend.update_attributes(friend_params)
          render json: {status: 'SUCCESS' , message: 'Updated Friend' , data:friend }, status: :ok
        else
          render json: {status: 'ERROR' , message: 'Friend not updated' , data:friend.errors }, status: :unprocessable_entity
        end
      end

      private
      def friend_params
        params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter)
      end
    end
  end
end