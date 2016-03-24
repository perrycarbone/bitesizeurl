module ApplicationHelper

  def add_url_prefix(short_path)
    if Rails.env.development?
      "http://localhost:3000/" + "#{short_path}"
    else
      "http://bytesizeurl.herokuapp.com/" + "#{short_path}"
    end
  end
end
