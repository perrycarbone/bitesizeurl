class PagesController < ApplicationController

  def home
    @urls = Url.order(times_visited: :desc).take(100)
    @url = Url.new
  end
end
