class Request < ActiveRecord::Base
  validates :colleges, :first, :last, :email, :phone, :high_school, presence: true
end
