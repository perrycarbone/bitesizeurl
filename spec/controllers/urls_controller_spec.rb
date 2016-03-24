require 'rails_helper'

describe UrlsController do
  describe "GET search" do
    context "when a match is identified in the database" do
      it "redirects to the long url when match is identified in database" do
        url = Fabricate(:url)

        get :search, { path: url.path }

        expect(response).to redirect_to(url.full_url)
      end

      it "increments that times_visited count by 1" do
        url = Fabricate(:url, times_visited: 100)

        get :search, { path: url.path }
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

  describe "POST create" do
    context "when URL does not previously exist" do
      it "creates the Url" do
        post :create, url: Fabricate.attributes_for(:url)

        expect(Url.count).to eq(1)
      end

      it "displays the flash success message" do
        post :create, url: Fabricate.attributes_for(:url)

        expect(flash[:success]).to be_present
      end

      it "redirects to the url show page" do
        post :create, url: { full_url: "http://example.com" }

        expect(response).to redirect_to url_path(Url.first)
      end
    end

    context "when URL already exists" do
      let(:existing_url) { Fabricate(:url) }

      it "finds the existing URL record" do
        post :create, url: { full_url: existing_url.full_url }

        expect(Url.count).to eq(1)
      end

      it "displays the flash success message" do
        post :create, url: { full_url: existing_url.full_url }

        expect(flash[:success]).to be_present
      end

      it "redirects to the url show page" do
        post :create, url: { full_url: existing_url.full_url }

        expect(response).to redirect_to url_path(Url.first)
      end
    end

    context "with invalid input" do

      it "does not create the url" do
        post :create, url: { full_url: "4928fksdnk" }

        expect(Url.count).to eq(0)
      end

      it "displays the flash danger message" do
        post :create, url: { full_url: "4928fksdnk" }

        expect(flash[:danger]).to be_present
      end

      it "redirects to the home page path" do
        post :create, url: { full_url: "4928fksdnk" }

        expect(response).to redirect_to home_page_path
      end
    end
  end
end
