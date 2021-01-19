class HomeController < ApplicationController
  def index
    @users = User.all
    @showDB = ActiveRecord::Base.connection.tables

  end
end
