module ApplicationHelper

  def add_url_prefix(path)
    if Rails.env.development?
      "http://localhost:3000/" + "#{path}"
    else
      "http://bytesizeurl.herokuapp.com/" + "#{path}"
    end
  end
end
