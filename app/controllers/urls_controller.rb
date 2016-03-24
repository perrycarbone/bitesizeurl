require 'path_generator'

class UrlsController < ApplicationController

  def search
    @url = Url.find_by(path: params["path"])

    if @url
      redirect_to @url.full_url
      @url.update_times_visited!
    else
      render_404
    end
  end

  def show
    @url = Url.find_by(id: params[:id])
  end

  def create
    @url = Url.find_by(full_url: params[:url].values)

    if @url == nil
      @url = Url.new(url_params)

      if @url.path_can_be_generated?
        @url.generate_shortened_url!
        redirect_to url_path(@url), flash: { success: "You have succesfully created a BytesizeURL!" }
      else
        redirect_to home_page_path, flash: { danger: "Please enter a valid URL." }
      end

    else
      redirect_to url_path(@url), flash: { success: "We already have a BiteSizeURL for this link.  Here you go!" }
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

  def url_params
    params.require(:url).permit(:full_url)
  end
end
