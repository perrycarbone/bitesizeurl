require 'rails_helper'

describe UrlsController do
  describe "GET search" do
    it "redirects to the long url when match is identified in database" do
      url = Fabricate(:url)

      get :search, { path: url.short_url }

      expect(response).to redirect_to(url.full_url)
    end

    it "renders 404 page not found when no match identified in database" do
      get :search, { path: "someunrecognizedpath" }

      expect(response).to render_template(:file => "#{Rails.root}/public/404.html")
    end
  end
end
