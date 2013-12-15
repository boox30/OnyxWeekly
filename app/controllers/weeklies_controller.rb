class WeekliesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_weekly, only: [:show, :edit, :update, :destroy]

  # GET /weeklies
  # GET /weeklies.json
  def index
    @weeklies = Weekly.all
  end

  # GET /weeklies/1
  # GET /weeklies/1.json
  def show
  end

  # GET /weeklies/new
  def new
    @weekly = Weekly.new
  end

  # GET /weeklies/1/edit
  def edit
  end

  # POST /weeklies
  # POST /weeklies.json
  def create
    @weekly = Weekly.new(weekly_params)

    respond_to do |format|
      if @weekly.save
        current_user.weeklies << @weekly
        format.html { redirect_to root_path, notice: 'Weekly was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weekly }
      else
        format.html { render action: 'new' }
        format.json { render json: @weekly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeklies/1
  # PATCH/PUT /weeklies/1.json
  def update
    respond_to do |format|
      if @weekly.update(weekly_params)
        format.html { redirect_to root_path, notice: 'Weekly was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weekly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeklies/1
  # DELETE /weeklies/1.json
  def destroy
    @weekly.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly
      @weekly = Weekly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekly_params
      params.require(:weekly).permit(:title, :body, :body_html)
    end
end
