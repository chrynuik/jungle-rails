class Admin::DashboardController < ApplicationController
  Rails.configuration.admin = {
    :user => ENV['USER'],
    :password => ENV['PASSWORD']
  }
  http_basic_authenticate_with name: Rails.configuration.admin[:user], password: Rails.configuration.admin[:password]
  def show
  end
end
