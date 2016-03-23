require 'rails_helper'

describe PagesController do
  describe "GET home" do
    it "sets @url" do
      get :home

      expect(assigns(:url)).to be_instance_of(Url)
    end
  end
end
