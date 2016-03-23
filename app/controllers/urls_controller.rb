require 'url_generator'

class UrlsController < ApplicationController

  def search
    @url = Url.find_by(short_url: params["path"])

    if @url
      redirect_to @url.full_url
      @url.times_visited += 1
      @url.save
    else
      render_404
    end
  end

  def create
    @url = Url.find_by(full_url: params[:url].values)

    if @url == nil
      @url = Url.new(url_params)

      if valid_url?(@url.full_url) && @url.save
        @url.short_url = UrlGenerator.new(@url.id).generate_short_url
        @url.save
        redirect_to url_path(@url), flash: { success: "You have succesfully created a BitesizeURL!" }
      else
        redirect_to home_page_path, flash: { danger: "Please enter a valid url." }
      end

    else
      redirect_to url_path(@url), flash: { success: "Hey, we already have a BiteSizeURL for that one.  Here it is!" }
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404",
                           :layout => false,
                           :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end

  def url_params
    params.require(:url).permit(:full_url)
  end
end
