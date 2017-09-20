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

  context "User with valid credentials" do 
    before do
      @project = Project.create(title: 'Test', description: 'Tesddas dasda', user_id: @user.id)
      login_as(@user)
    end

    describe "GET /projects" do
      it "responds to status 200" do
        get "/projects"
        expect(response.status).to eq 200
      end
    end

    describe "GET /projects/new" do
      it "responds to status 200" do
        get "/projects/new"
        expect(response.status).to eq 200
      end
    end

    describe "GET /projects/:id/edit" do
      it "responds to status 200" do
        get "/projects/#{@project.id}/edit"
        expect(response.status).to eq 200
      end
    end

    describe "GET /projects/:id" do
      it "responds to status 200" do
        get "/projects/#{@project.id}"
        expect(response.status).to eq 200
      end
    end
  end

  context "User with invalid credentials" do 
    before do
      @project = Project.create(title: 'Test', description: 'Tesddas dasda', user_id: @user.id)
    end

    describe "GET /projects" do
      it "responds to status 200" do
        get "/projects"
        expect(response.status).to eq 302
      end
    end

    describe "GET /projects/new" do
      it "responds to status 200" do
        get "/projects/new"
        expect(response.status).to eq 302
      end
    end

    describe "GET /projects/:id/edit" do
      it "responds to status 200" do
        get "/projects/#{@project.id}/edit"
        expect(response.status).to eq 302
      end
    end

    describe "GET /projects/:id" do
      it "responds to status 200" do
        get "/projects/#{@project.id}"
        expect(response.status).to eq 302
      end
    end
  end
end