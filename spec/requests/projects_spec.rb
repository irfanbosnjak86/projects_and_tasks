require "rails_helper"

RSpec.describe "Projects Request", type: :request do 

  before do
    @user = User.create(email: 'user@test.com', password: '12345678', password_confirmation: '12345678')
  end

  describe "GET /" do 
    context "User with valid credentials" do 
      before do
        login_as(@user)
      end
      it "responds to status 200" do
        get "/"
        expect(response.status).to eq 200
      end
    end

    context "User with invalid credentials" do 
      it "responds to status 302" do
        get "/"
        expect(response.status).to eq 302
      end
    end
  end
end