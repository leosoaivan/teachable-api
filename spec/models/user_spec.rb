# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    let!(:user) { create(:user_with_gradebooks) }

    it { is_expected.to have_many(:gradebooks) }
    it 'destroys associated gradebooks' do
      expect { user.destroy }.to change(Gradebook, :count).by(-user.gradebooks.count)
    end
  end
  describe 'Attributes' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
