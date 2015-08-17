class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    self.subject_item_notes.blank? ? 0.00 : 4.50
  end
end
