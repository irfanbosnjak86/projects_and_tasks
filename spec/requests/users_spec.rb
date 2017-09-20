require "rails_helper"

RSpec.describe "User Request", type: :request do 
  
  describe "GET /users/sign_in" do 
    it "responds to status 200" do
      get "/users/sign_in"
      expect(response.status).to eq 200
    end
  end

  describe "GET /users/sign_up" do 
    it "responds to status 200" do
      get "/users/sign_up"
      expect(response.status).to eq 200
    end
  end
end