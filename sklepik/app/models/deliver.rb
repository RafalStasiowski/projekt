class Deliver < ActiveRecord::Base
  has_many :orders
end
