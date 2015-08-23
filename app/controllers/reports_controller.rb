class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:students)

  before_action :authenticate_user!, only: :payments
end
