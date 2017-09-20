require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @user = User.create(email: 'user@test.com', password: '12345678', password_confirmation: '12345678')
    @project = Project.new(title: 'Test', description: 'Tesddas dasda', user_id: @user.id)
  end
  
  describe "Validations" do
    it "Project without title is not valid" do
      @project.title = nil
      @project.save
      expect(@project).to_not be_valid
    end

    it "Project without description is not valid" do
      @project.description = nil
      @project.save
      expect(@project).to_not be_valid
    end

    it "Project with title is valid" do
      @project.title = "Some Text"
      @project.save
      expect(@project).to be_valid
    end

    it "Project with description is valid" do
      @project.description = "Some Text"
      @project.save
      expect(@project).to be_valid
    end
  end
end
