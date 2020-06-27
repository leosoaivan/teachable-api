require 'rails_helper'

RSpec.describe Gradebook, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end
  describe "Attributes" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
