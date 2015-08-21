class Payment < ActiveRecord::Base
  validates_presence_of :balance, :payment_date
  belongs_to :student
end
