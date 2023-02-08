class Report < ApplicationRecord
  has_many :comments, as: :content
end
