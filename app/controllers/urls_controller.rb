class UrlsController < ApplicationController
  # before_action :set_url, only: [:show, :edit, :update, :destroy]
  before_action :check_present_url, only: :create

  # GET /urls
  def index
    @urls = Url.all
  end

  # GET /urls/1
  def show
    @url = Url.find_by_slug(params[:slug])
    if @url.present?
      binding.pry
      if redirect_to @url.url
        @url.count_click += 1
        @url.referer = request.referer
        @url.save
      end
    else
      @urls = Url.all
      render :index
    end
  end

  # GET /urls/new
  def new
    @url = Url.new
  end


  # POST /urls
  def create
    unless @url_ready.present?
      @url        = Url.new(url_params)
      @url.slug   = @url.build_slug
      @url.title  = Mechanize.new.get(@url.url).title

      respond_to do |format|
        if @url.save
          format.html { redirect_to root_url(@url), notice: "Url successfully created" }
          format.js
          format.json { render action: 'show', status: :created, location: @url }
        else
          format.html { render action: 'new' }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, notice: "Your url has been created!"
    end

  end

  # DELETE /urls/1
  def destroy
    @url.destroy
    redirect_to urls_url, notice: 'Url was successfully destroyed.'
  end

  private
    def check_present_url
      @url_ready = Url.find_by_url(url_params[:url])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:url, :slug, :count_click)
    end
end
