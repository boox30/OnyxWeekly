class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:find_weeklies_by_user]
  def index
    @user = User.all
    @weeklies = current_user.weeklies
  end
  
  def find_weeklies_by_user
    @weeklies = @user.weeklies
    respond_to do |format|
      format.js { @weeklies }
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
