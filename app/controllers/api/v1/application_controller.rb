class Api::V1::ApplicationController < ApplicationController
  # before_action :authenticate_user!          # Deviseの認証ヘルパー
  skip_forgery_protection
end