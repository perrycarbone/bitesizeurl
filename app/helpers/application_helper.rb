module ApplicationHelper

  def add_url_prefix(short_url)
    if Rails.env.development?
      "http://localhost:3000/" + "#{short_url}"
    else
      "http://bytesizeurl.herokuapp.com/" + "#{short_url}"
    end
  end
end
