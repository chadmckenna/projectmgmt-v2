class Project < ApplicationRecord
  belongs_to :client
  has_many :todos, as: :todoable
  has_rich_text :description
end
