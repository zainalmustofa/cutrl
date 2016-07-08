class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url, only: [:show_url, :edit, :update, :destroy]
  layout "dashboard"

  # GET /dashboards
  def index
    @dashboards = Dashboard.all
  end

  # GET /dashboards/1
  def show
    @url = Url.new
    @urls    = current_user.urls.page(params[:page])
  end

  def show_url
    @url      = Url.find(params[:id])
  end

  def details_url
    @url      = Url.find(params[:id])
    @clicks    = @url.clicks.page(params[:page])
    @country   = @url.clicks.pluck(:country)
  end

  def details_referer
    @url      = Url.find(params[:url_id])
    @click    = Click.find(params[:click_id])
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  def create
    @dashboard = Dashboard.new(dashboard_params)

    if @dashboard.save
      redirect_to @dashboard, notice: 'Dashboard was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dashboards/1
  def update
    if @dashboard.update(dashboard_params)
      redirect_to @dashboard, notice: 'Dashboard was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dashboards/1
  def destroy
    @url.destroy
    redirect_to dashboard_path, notice: 'URL was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url  = Url.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dashboard_params
      params[:dashboard]
    end
end
