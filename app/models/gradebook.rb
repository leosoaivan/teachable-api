# frozen_string_literal: true

class Gradebook < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
end
