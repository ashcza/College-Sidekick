class Request < ActiveRecord::Base
  validates :colleges, :first, :last, :email, :phone, presence: true
end
