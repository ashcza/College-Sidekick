class Sidekick < ActiveRecord::Base
  validates :college, :year, :major, :first, :last, :email, :phone, presence: true
end
