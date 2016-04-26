require 'open-uri'

class UrlsController < ApplicationController
  # before_action :set_url, only: [:show, :edit, :update, :destroy]
  before_action :check_present_url, only: :create
  before_action :is_mobile?, only: :show
  # after_save    :redirect_url, only: :show
  # GET /urls
  def index
    @urls = Url.all
  end

  # GET /urls/1
  def show
    @url        = Url.find_by_slug(params[:slug])
    @ip_detail  = your_country
    if @url.present?

     click = @url.clicks.create(
        referer:    request.referer, 
        browser:    browser.name, 
        is_mobile:  @mobile.present? ? true : false, 
        country:    @ip_detail["country"]
        # ip:         @ip_detail["ip"],
        # region:     @ip_detail["region"],
        # loc:        @ip_detail["loc"]
      )
      
      @url.count_click += 1
      @url.referer = request.referer rescue nil
      @url.save

      if click.save
        redirect_to @url.url
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
      @url              = Url.new(url_params)
      @url.slug         = @url.build_slug

      respond_to do |format|
        if @url.save
          @main_domain =  @url.url.match(/^https?\:\/\/([^\/?#]+)(?:[\/?#]|$)/i)
          @url.update(
            title: Mechanize.new.get(@url.url).title,
            user_id: (current_user.id rescue nil),
            main_domain: @main_domain.present? ? @main_domain[1] : @main_domain[0]
             )
          flash[:notice] = 'message'
          format.js
        else
          format.html { 
            redirect_to root_url(@url)
            flash[:notice] = @url.errors.messages[:url][0]
            }
        end
      end
    else
      @url = @url_ready
      respond_to do |format|
        format.html { redirect_to root_url(@url), notice: "Your url has been created!" }
        format.js
        format.json { render action: 'show', status: :created, location: @url }
      end
    end

  end

  # DELETE /urls/1
  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to dashboard_url
    flash[:notice] = 'Url was successfully destroyed.'
  end

  private

    def redirect_url
      redirect_to @url.url
    end

    def is_mobile?
      @mobile  = request.env['HTTP_USER_AGENT'].downcase.match(/android|iphone/)
    end

    def your_country
      remote_ip = 
        if request.remote_ip == "127.0.0.1"
          '180.214.232.73'
        else
          request.remote_ip
        end
        
      @ip_detail   = JSON.parse(open('http://ipinfo.io/' + remote_ip).read) 
    end

    def check_present_url
      @url_ready = Url.find_by_url(url_params[:url])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:url, :slug, :count_click, :user_id)
    end
end
