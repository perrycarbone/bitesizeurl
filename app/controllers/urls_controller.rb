class UrlsController < ApplicationController

  def search
    @url = Url.find_by(short_url: params["path"])

    if @url
      redirect_to @url.full_url
      @url.times_visited += 1
      @url.save
      require 'pry'; binding.pry
    else
      render_404
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
