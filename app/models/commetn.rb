class Commetn < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user
  belongs_to :entry
end
