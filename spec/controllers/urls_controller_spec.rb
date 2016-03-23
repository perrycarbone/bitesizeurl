require 'rails_helper'

describe UrlsController do
  describe "GET search" do
    context "when a match is identified in the database" do
      it "redirects to the long url when match is identified in database" do
        url = Fabricate(:url)

        get :search, { path: url.short_url }

        expect(response).to redirect_to(url.full_url)
      end

      it "increments that times_visited count by 1" do
        url = Fabricate(:url, times_visited: 100)

        get :search, { path: url.short_url }
        expect(url.reload.times_visited).to eq(101)
      end
    end

    context "when a match is identified in the database" do
      it "renders 404 page not found when no match identified in database" do
        get :search, { path: "someunrecognizedpath" }

        expect(response).to render_template(:file => "#{Rails.root}/public/404.html")
      end
    end
  end
end
