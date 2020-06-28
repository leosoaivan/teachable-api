# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user_with_gradebooks) }

  describe 'Associations' do
    it { is_expected.to have_many(:gradebooks).dependent(:destroy) }
  end

  describe 'Attributes' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
