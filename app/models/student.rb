class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_one  :payment, dependent: :destroy

  accepts_nested_attributes_for :subject_items

  after_create :set_default_payment_date
  validates :first_name, :last_name, presence: true


  def formatted_birthdate
    birthdate.to_s.gsub(/-(?!.*-)/,"_")
  end

  def set_default_payment_date
    Payment.create!(payment_date: Date.today + 30.days, student: self)
  end
end
