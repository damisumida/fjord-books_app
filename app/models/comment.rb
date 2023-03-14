# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :user
end
