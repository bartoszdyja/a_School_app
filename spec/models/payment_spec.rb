require 'rails_helper'

RSpec.describe Payment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :balance }
    it { is_expected.to validate_presence_of :payment_date }
  end
end