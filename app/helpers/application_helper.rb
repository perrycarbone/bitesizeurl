module ApplicationHelper

  def add_url_prefix(short_url)
    if Rails.env.development?
      "http://localhost:3000/" + "#{short_url}"
    else
      "http://bitesizeurl.herokuapp.com/" + "#{short_url}"
    end
  end
end
