class Teacher < ActiveRecord::Base
  TITLES = %w(Dr. Prof. TA)
  has_many :subject_items, dependent: :nullify
  accepts_nested_attributes_for :subject_items

  validates :first_name, :last_name, presence: true
  validates :academic_title, inclusion: { in: TITLES }, presence: true

end
