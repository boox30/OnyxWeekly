class PeoplesController < ApplicationController
  
  def index
    @users = User.all
  end
end
