class Player < ActiveRecord::Base
  belongs_to :user

  validates :name, :team, :cost, :quantity, :presence => true
end
