class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, :description, presence: true
end
